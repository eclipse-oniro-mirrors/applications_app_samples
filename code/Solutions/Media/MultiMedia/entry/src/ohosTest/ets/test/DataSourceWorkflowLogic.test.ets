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
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-523|/logic/item-524|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-523|/logic/item-524|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(2) === incoming));
      expect(source.getData(2) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(2);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 3, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(3);
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
        String('/logic/item-524|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-524|/logic/item-950');
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1318
     * @tc.name MultiMedia_Workflow_1318
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1318', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1318';
      LogicTestLog.begin(name, 'length=2;type=4;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 524, 4);
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
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-950|/logic/item-524|/logic/item-525'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-950|/logic/item-524|/logic/item-525');
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
      LogicTestLog.number(name, 'delete total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased workflow length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-524|/logic/item-525'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-524|/logic/item-525');
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1319
     * @tc.name MultiMedia_Workflow_1319
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1319', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1319';
      LogicTestLog.begin(name, 'length=2;type=4;position=2');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(2, 524, 4);
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
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(2, incoming);
      LogicTestLog.number(name, 'insert total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'inserted order',
        String('/logic/item-524|/logic/item-525|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-524|/logic/item-525|/logic/item-950');
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(2) === incoming));
      expect(source.getData(2) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(2);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 4, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(4);
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
        String('/logic/item-525|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-525|/logic/item-950');
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1320
     * @tc.name MultiMedia_Workflow_1320
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1320', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1320';
      LogicTestLog.begin(name, 'length=4;type=1;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 541, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected139: string =
        '/logic/item-950|/logic/item-541|/logic/item-542|/logic/item-' +
        '543|/logic/item-544';
      LogicTestLog.value(name, 'inserted order',
        String(expected139),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected139);
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
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-541|/logic/item-542|/logic/item-543|/logic/item-544'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-541|/logic/item-542|/logic/item-543|/logic/item-544');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1321
     * @tc.name MultiMedia_Workflow_1321
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1321', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1321';
      LogicTestLog.begin(name, 'length=4;type=1;position=4');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 541, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(4, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected140: string =
        '/logic/item-541|/logic/item-542|/logic/item-543|/logic/item-' +
        '544|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected140),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected140);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(4) === incoming));
      expect(source.getData(4) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(4);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(4).displayName));
      expect(source.getData(4).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 1, source.getData(4).fileType);
      expect(source.getData(4).fileType).assertEqual(1);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(4).duration);
      expect(source.getData(4).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(4).dateAdded);
      expect(source.getData(4).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-542|/logic/item-543|/logic/item-544|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-542|/logic/item-543|/logic/item-544|/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:4|change:4|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:4|change:4|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:4|change:4'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:4|change:4');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1322
     * @tc.name MultiMedia_Workflow_1322
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1322', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1322';
      LogicTestLog.begin(name, 'length=4;type=2;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 542, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected141: string =
        '/logic/item-950|/logic/item-542|/logic/item-543|/logic/item-' +
        '544|/logic/item-545';
      LogicTestLog.value(name, 'inserted order',
        String(expected141),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected141);
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
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-542|/logic/item-543|/logic/item-544|/logic/item-545'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-542|/logic/item-543|/logic/item-544|/logic/item-545');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1323
     * @tc.name MultiMedia_Workflow_1323
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1323', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1323';
      LogicTestLog.begin(name, 'length=4;type=2;position=4');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 542, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(4, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected142: string =
        '/logic/item-542|/logic/item-543|/logic/item-544|/logic/item-' +
        '545|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected142),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected142);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(4) === incoming));
      expect(source.getData(4) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(4);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(4).displayName));
      expect(source.getData(4).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 2, source.getData(4).fileType);
      expect(source.getData(4).fileType).assertEqual(2);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(4).duration);
      expect(source.getData(4).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(4).dateAdded);
      expect(source.getData(4).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-543|/logic/item-544|/logic/item-545|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-543|/logic/item-544|/logic/item-545|/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:4|change:4|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:4|change:4|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:4|change:4'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:4|change:4');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1324
     * @tc.name MultiMedia_Workflow_1324
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1324', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1324';
      LogicTestLog.begin(name, 'length=4;type=3;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 543, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected143: string =
        '/logic/item-950|/logic/item-543|/logic/item-544|/logic/item-' +
        '545|/logic/item-546';
      LogicTestLog.value(name, 'inserted order',
        String(expected143),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected143);
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
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-543|/logic/item-544|/logic/item-545|/logic/item-546'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-543|/logic/item-544|/logic/item-545|/logic/item-546');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1325
     * @tc.name MultiMedia_Workflow_1325
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1325', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1325';
      LogicTestLog.begin(name, 'length=4;type=3;position=4');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 543, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(4, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected144: string =
        '/logic/item-543|/logic/item-544|/logic/item-545|/logic/item-' +
        '546|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected144),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected144);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(4) === incoming));
      expect(source.getData(4) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(4);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(4).displayName));
      expect(source.getData(4).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 3, source.getData(4).fileType);
      expect(source.getData(4).fileType).assertEqual(3);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(4).duration);
      expect(source.getData(4).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(4).dateAdded);
      expect(source.getData(4).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-544|/logic/item-545|/logic/item-546|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-544|/logic/item-545|/logic/item-546|/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:4|change:4|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:4|change:4|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:4|change:4'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:4|change:4');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1326
     * @tc.name MultiMedia_Workflow_1326
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1326', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1326';
      LogicTestLog.begin(name, 'length=4;type=4;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 544, 4);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected145: string =
        '/logic/item-950|/logic/item-544|/logic/item-545|/logic/item-' +
        '546|/logic/item-547';
      LogicTestLog.value(name, 'inserted order',
        String(expected145),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected145);
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
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-544|/logic/item-545|/logic/item-546|/logic/item-547'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-544|/logic/item-545|/logic/item-546|/logic/item-547');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1327
     * @tc.name MultiMedia_Workflow_1327
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1327', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1327';
      LogicTestLog.begin(name, 'length=4;type=4;position=4');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(4, 544, 4);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(4, incoming);
      LogicTestLog.number(name, 'insert total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      const expected146: string =
        '/logic/item-544|/logic/item-545|/logic/item-546|/logic/item-' +
        '547|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected146),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected146);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(4) === incoming));
      expect(source.getData(4) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(4);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(4).displayName));
      expect(source.getData(4).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 4, source.getData(4).fileType);
      expect(source.getData(4).fileType).assertEqual(4);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(4).duration);
      expect(source.getData(4).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(4).dateAdded);
      expect(source.getData(4).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased workflow length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'post-delete order',
        String('/logic/item-545|/logic/item-546|/logic/item-547|/logic/item-950'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-545|/logic/item-546|/logic/item-547|/logic/item-950');
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:4|change:4|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:4|change:4|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:4|change:4'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:4|change:4');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1328
     * @tc.name MultiMedia_Workflow_1328
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1328', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1328';
      LogicTestLog.begin(name, 'length=8;type=1;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 581, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected147: string =
        '/logic/item-950|/logic/item-581|/logic/item-582|/logic/item-' +
        '583|/logic/item-584|/logic/item-585|/logic/item-586|/logic/i' +
        'tem-587|/logic/item-588';
      LogicTestLog.value(name, 'inserted order',
        String(expected147),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected147);
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
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected148: string =
        '/logic/item-581|/logic/item-582|/logic/item-583|/logic/item-' +
        '584|/logic/item-585|/logic/item-586|/logic/item-587|/logic/i' +
        'tem-588';
      LogicTestLog.value(name, 'post-delete order',
        String(expected148),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected148);
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1329
     * @tc.name MultiMedia_Workflow_1329
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1329', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1329';
      LogicTestLog.begin(name, 'length=8;type=1;position=8');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 581, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(8, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected149: string =
        '/logic/item-581|/logic/item-582|/logic/item-583|/logic/item-' +
        '584|/logic/item-585|/logic/item-586|/logic/item-587|/logic/i' +
        'tem-588|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected149),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected149);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(8) === incoming));
      expect(source.getData(8) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(8);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(8).displayName));
      expect(source.getData(8).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 1, source.getData(8).fileType);
      expect(source.getData(8).fileType).assertEqual(1);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(8).duration);
      expect(source.getData(8).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(8).dateAdded);
      expect(source.getData(8).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected150: string =
        '/logic/item-582|/logic/item-583|/logic/item-584|/logic/item-' +
        '585|/logic/item-586|/logic/item-587|/logic/item-588|/logic/i' +
        'tem-950';
      LogicTestLog.value(name, 'post-delete order',
        String(expected150),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected150);
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:8|change:8|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:8|change:8|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:8|change:8'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:8|change:8');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1330
     * @tc.name MultiMedia_Workflow_1330
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1330', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1330';
      LogicTestLog.begin(name, 'length=8;type=2;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 582, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected151: string =
        '/logic/item-950|/logic/item-582|/logic/item-583|/logic/item-' +
        '584|/logic/item-585|/logic/item-586|/logic/item-587|/logic/i' +
        'tem-588|/logic/item-589';
      LogicTestLog.value(name, 'inserted order',
        String(expected151),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected151);
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
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected152: string =
        '/logic/item-582|/logic/item-583|/logic/item-584|/logic/item-' +
        '585|/logic/item-586|/logic/item-587|/logic/item-588|/logic/i' +
        'tem-589';
      LogicTestLog.value(name, 'post-delete order',
        String(expected152),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected152);
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1331
     * @tc.name MultiMedia_Workflow_1331
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1331', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1331';
      LogicTestLog.begin(name, 'length=8;type=2;position=8');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 582, 2);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 2)[0];
      source.addData(8, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected153: string =
        '/logic/item-582|/logic/item-583|/logic/item-584|/logic/item-' +
        '585|/logic/item-586|/logic/item-587|/logic/item-588|/logic/i' +
        'tem-589|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected153),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected153);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(8) === incoming));
      expect(source.getData(8) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(8);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(8).displayName));
      expect(source.getData(8).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 2, source.getData(8).fileType);
      expect(source.getData(8).fileType).assertEqual(2);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(8).duration);
      expect(source.getData(8).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(8).dateAdded);
      expect(source.getData(8).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected154: string =
        '/logic/item-583|/logic/item-584|/logic/item-585|/logic/item-' +
        '586|/logic/item-587|/logic/item-588|/logic/item-589|/logic/i' +
        'tem-950';
      LogicTestLog.value(name, 'post-delete order',
        String(expected154),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected154);
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:8|change:8|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:8|change:8|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:8|change:8'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:8|change:8');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1332
     * @tc.name MultiMedia_Workflow_1332
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1332', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1332';
      LogicTestLog.begin(name, 'length=8;type=3;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 583, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected155: string =
        '/logic/item-950|/logic/item-583|/logic/item-584|/logic/item-' +
        '585|/logic/item-586|/logic/item-587|/logic/item-588|/logic/i' +
        'tem-589|/logic/item-590';
      LogicTestLog.value(name, 'inserted order',
        String(expected155),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected155);
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
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected156: string =
        '/logic/item-583|/logic/item-584|/logic/item-585|/logic/item-' +
        '586|/logic/item-587|/logic/item-588|/logic/item-589|/logic/i' +
        'tem-590';
      LogicTestLog.value(name, 'post-delete order',
        String(expected156),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected156);
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1333
     * @tc.name MultiMedia_Workflow_1333
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1333', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1333';
      LogicTestLog.begin(name, 'length=8;type=3;position=8');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 583, 3);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 3)[0];
      source.addData(8, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected157: string =
        '/logic/item-583|/logic/item-584|/logic/item-585|/logic/item-' +
        '586|/logic/item-587|/logic/item-588|/logic/item-589|/logic/i' +
        'tem-590|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected157),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected157);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(8) === incoming));
      expect(source.getData(8) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(8);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(8).displayName));
      expect(source.getData(8).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 3, source.getData(8).fileType);
      expect(source.getData(8).fileType).assertEqual(3);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(8).duration);
      expect(source.getData(8).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(8).dateAdded);
      expect(source.getData(8).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected158: string =
        '/logic/item-584|/logic/item-585|/logic/item-586|/logic/item-' +
        '587|/logic/item-588|/logic/item-589|/logic/item-590|/logic/i' +
        'tem-950';
      LogicTestLog.value(name, 'post-delete order',
        String(expected158),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected158);
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:8|change:8|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:8|change:8|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:8|change:8'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:8|change:8');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1334
     * @tc.name MultiMedia_Workflow_1334
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1334', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1334';
      LogicTestLog.begin(name, 'length=8;type=4;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 584, 4);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected159: string =
        '/logic/item-950|/logic/item-584|/logic/item-585|/logic/item-' +
        '586|/logic/item-587|/logic/item-588|/logic/item-589|/logic/i' +
        'tem-590|/logic/item-591';
      LogicTestLog.value(name, 'inserted order',
        String(expected159),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected159);
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
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected160: string =
        '/logic/item-584|/logic/item-585|/logic/item-586|/logic/item-' +
        '587|/logic/item-588|/logic/item-589|/logic/item-590|/logic/i' +
        'tem-591';
      LogicTestLog.value(name, 'post-delete order',
        String(expected160),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected160);
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1335
     * @tc.name MultiMedia_Workflow_1335
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1335', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1335';
      LogicTestLog.begin(name, 'length=8;type=4;position=8');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(8, 584, 4);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 4)[0];
      source.addData(8, incoming);
      LogicTestLog.number(name, 'insert total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      const expected161: string =
        '/logic/item-584|/logic/item-585|/logic/item-586|/logic/item-' +
        '587|/logic/item-588|/logic/item-589|/logic/item-590|/logic/i' +
        'tem-591|/logic/item-950';
      LogicTestLog.value(name, 'inserted order',
        String(expected161),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected161);
      LogicTestLog.value(name, 'rename item alias', String(true), String(source.getData(8) === incoming));
      expect(source.getData(8) === incoming).assertEqual(true);
      incoming.displayName = 'renamed-950';
      source.notifyDataChange(8);
      LogicTestLog.value(name, 'renamed display name', String('renamed-950'), String(source.getData(8).displayName));
      expect(source.getData(8).displayName).assertEqual('renamed-950');
      LogicTestLog.value(name, 'rename preserves identity', String('/logic/item-950'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-950');
      LogicTestLog.number(name, 'rename preserves type', 4, source.getData(8).fileType);
      expect(source.getData(8).fileType).assertEqual(4);
      LogicTestLog.number(name, 'rename preserves duration', 950950, source.getData(8).duration);
      expect(source.getData(8).duration).assertEqual(950950);
      LogicTestLog.number(name, 'rename preserves timestamp', 1700000950, source.getData(8).dateAdded);
      expect(source.getData(8).dateAdded).assertEqual(1700000950);
      source.unregisterDataChangeListener(second);
      source.deleteData(0, 1);
      source.notifyDataReload();
      LogicTestLog.number(name, 'delete total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased workflow length', 8, original.length);
      expect(original.length).assertEqual(8);
      const expected162: string =
        '/logic/item-585|/logic/item-586|/logic/item-587|/logic/item-' +
        '588|/logic/item-589|/logic/item-590|/logic/item-591|/logic/i' +
        'tem-950';
      LogicTestLog.value(name, 'post-delete order',
        String(expected162),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected162);
      LogicTestLog.value(name, 'first full event history',
        String('reload|add:8|change:8|reload'),
        String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload|add:8|change:8|reload');
      LogicTestLog.value(name, 'removed listener history',
        String('reload|add:8|change:8'),
        String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload|add:8|change:8');
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
      LogicTestLog.number(name, 'replacing does not clear old reference', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'new array identity', String(false), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(false);
      LogicTestLog.number(name, 'clear stays isolated', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1336
     * @tc.name MultiMedia_Workflow_1336
     * @tc.desc Album-style load, insert, rename, delete, reload and instance isolation workflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Workflow_1336', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Workflow_1336';
      LogicTestLog.begin(name, 'length=16;type=1;position=0');
      const source: MediaDataSource = new MediaDataSource();
      const other: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const otherListener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      other.registerDataChangeListener(otherListener);
      const original: MediaData[] = createMediaRows(16, 661, 1);
      source.setDataArray(original);
      other.setDataArray(createMediaRows(1, 990, 4));
      source.notifyDataReload();
      LogicTestLog.number(name, 'loaded total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'independent total', 1, other.totalCount());
      expect(other.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'first load event', String('reload'), String(first.events.join('|')));
      expect(first.events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'second load event', String('reload'), String(second.events.join('|')));
      expect(second.events.join('|')).assertEqual('reload');
      const incoming: MediaData = createMediaRows(1, 950, 1)[0];
      source.addData(0, incoming);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      const expected163: string =
        '/logic/item-950|/logic/item-661|/logic/item-662|/logic/item-' +
        '663|/logic/item-664|/logic/item-665|/logic/item-666|/logic/i' +
        'tem-667|/logic/item-668|/logic/item-669|/logic/item-670|/log' +
        'ic/item-671|/logic/item-672|/logic/item-673|/logic/item-674|' +
        '/logic/item-675|/logic/item-676';
      LogicTestLog.value(name, 'inserted order',
        String(expected163),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected163);
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
      LogicTestLog.number(name, 'delete total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased workflow length', 16, original.length);
      expect(original.length).assertEqual(16);
      const expected164: string =
        '/logic/item-661|/logic/item-662|/logic/item-663|/logic/item-' +
        '664|/logic/item-665|/logic/item-666|/logic/item-667|/logic/i' +
        'tem-668|/logic/item-669|/logic/item-670|/logic/item-671|/log' +
        'ic/item-672|/logic/item-673|/logic/item-674|/logic/item-675|' +
        '/logic/item-676';
      LogicTestLog.value(name, 'post-delete order',
        String(expected164),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected164);
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