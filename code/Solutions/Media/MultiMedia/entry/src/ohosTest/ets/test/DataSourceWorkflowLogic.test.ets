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

export default function DataSourceWorkflowLogic(): void {
  describe('DataSourceWorkflowLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1304
     * @tc.name MultiMedia_Workflow_1304
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1304', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1304';
      LogicTestLog.begin(name, 'length=1;type=1;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 511, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-511'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-511');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 1, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(1);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-511'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-511');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1305
     * @tc.name MultiMedia_Workflow_1305
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1305', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1305';
      LogicTestLog.begin(name, 'length=1;type=1;position=1');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 511, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(1, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-511|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-511|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(1) === incoming));
      expect(source.getData(1) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(1);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 1, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(1);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:1|change:1|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:1|change:1|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:1|change:1'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:1|change:1');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1306
     * @tc.name MultiMedia_Workflow_1306
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1306', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1306';
      LogicTestLog.begin(name, 'length=1;type=2;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 512, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-512'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-512');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 2, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(2);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-512'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-512');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1307
     * @tc.name MultiMedia_Workflow_1307
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1307', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1307';
      LogicTestLog.begin(name, 'length=1;type=2;position=1');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 512, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(1, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-512|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-512|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(1) === incoming));
      expect(source.getData(1) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(1);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 2, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(2);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:1|change:1|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:1|change:1|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:1|change:1'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:1|change:1');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1308
     * @tc.name MultiMedia_Workflow_1308
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1308', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1308';
      LogicTestLog.begin(name, 'length=1;type=3;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 513, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-513'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-513');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-513'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-513');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1309
     * @tc.name MultiMedia_Workflow_1309
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1309', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1309';
      LogicTestLog.begin(name, 'length=1;type=3;position=1');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 513, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(1, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-513|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-513|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(1) === incoming));
      expect(source.getData(1) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(1);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:1|change:1|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:1|change:1|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:1|change:1'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:1|change:1');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1310
     * @tc.name MultiMedia_Workflow_1310
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1310', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1310';
      LogicTestLog.begin(name, 'length=1;type=4;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 514, 4);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-514'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-514');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 4, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(4);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-514'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-514');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1311
     * @tc.name MultiMedia_Workflow_1311
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1311', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1311';
      LogicTestLog.begin(name, 'length=1;type=4;position=1');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(1, 514, 4);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(1, incoming);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-514|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-514|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(1) === incoming));
      expect(source.getData(1) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(1);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 4, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(4);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased workflow length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:1|change:1|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:1|change:1|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:1|change:1'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:1|change:1');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1312
     * @tc.name MultiMedia_Workflow_1312
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1312', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1312';
      LogicTestLog.begin(name, 'length=2;type=1;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 521, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-521|/logic/item-522'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-521|/logic/item-522');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 1, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(1);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased workflow length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-521|/logic/item-522'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-521|/logic/item-522');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1313
     * @tc.name MultiMedia_Workflow_1313
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1313', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1313';
      LogicTestLog.begin(name, 'length=2;type=1;position=2');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 521, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(2, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-521|/logic/item-522|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-521|/logic/item-522|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(2) === incoming));
      expect(source.getData(2) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(2);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 1, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(1);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased workflow length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-522|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-522|/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:2|change:2|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:2|change:2|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:2|change:2'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:2|change:2');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1314
     * @tc.name MultiMedia_Workflow_1314
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1314', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1314';
      LogicTestLog.begin(name, 'length=2;type=2;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 522, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-522|/logic/item-523'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-522|/logic/item-523');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 2, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(2);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased workflow length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-522|/logic/item-523'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-522|/logic/item-523');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1315
     * @tc.name MultiMedia_Workflow_1315
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1315', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1315';
      LogicTestLog.begin(name, 'length=2;type=2;position=2');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 522, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(2, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-522|/logic/item-523|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-522|/logic/item-523|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(2) === incoming));
      expect(source.getData(2) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(2);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 2, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(2);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased workflow length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-523|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-523|/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:2|change:2|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:2|change:2|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:2|change:2'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:2|change:2');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1316
     * @tc.name MultiMedia_Workflow_1316
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1316', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1316';
      LogicTestLog.begin(name, 'length=2;type=3;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 523, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-523|/logic/item-524'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-523|/logic/item-524');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(0) === incoming));
      expect(source.getData(0) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(0);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased workflow length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-523|/logic/item-524'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-523|/logic/item-524');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:0|change:0|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:0|change:0|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:0|change:0'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:0|change:0');
      LogicTestLog.number(name, 'other count unchanged', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'other identity unchanged', String('/logic/item-990'), String(other.getData(0).uri));
      expect(other.getData(0).uri).assertEqual('/logic/item-990');
      LogicTestLog.number(name, 'other observer unaffected', 0, otherListener.events.length);
      expect(otherListener.events.length).assertEqual(0);
      source.setDataArray([]);
      source.notifyDataReload();
      LogicTestLog.number(name, 'clear total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'replacing does not clear old reference', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1317
     * @tc.name MultiMedia_Workflow_1317
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1317', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1317';
      LogicTestLog.begin(name, 'length=2;type=3;position=2');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 523, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(2, incoming);