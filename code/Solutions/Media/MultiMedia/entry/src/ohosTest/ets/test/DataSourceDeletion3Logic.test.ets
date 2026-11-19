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

export default function DataSourceDeletion3Logic(): void {
  describe('DataSourceDeletion3Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1206
     * @tc.name MultiMedia_Delete_1206
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1206', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1206';
      LogicTestLog.begin(name, 'length=7;index=NaN;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 2);
      LogicTestLog.number(name, 'remaining total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.number(name, 'aliased delete length', 5, original.length);
      expect(original.length).assertEqual(5);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected68: string =
        '/logic/item-309|/logic/item-310|/logic/item-311|/logic/item-' +
        '312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected68),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected68);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1207
     * @tc.name MultiMedia_Delete_1207
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1207', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1207';
      LogicTestLog.begin(name, 'length=7;index=NaN;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 10);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1209
     * @tc.name MultiMedia_Delete_1209
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1209', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1209';
      LogicTestLog.begin(name, 'length=16;index=-Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 0);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected70: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected70),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected70);
      const expected71: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected71),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected71);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1210
     * @tc.name MultiMedia_Delete_1210
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1210', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1210';
      LogicTestLog.begin(name, 'length=16;index=-Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 2);
      LogicTestLog.number(name, 'remaining total', 14, source.totalCount());
      expect(source.totalCount()).assertEqual(14);
      LogicTestLog.number(name, 'aliased delete length', 14, original.length);
      expect(original.length).assertEqual(14);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected72: string =
        '/logic/item-318|/logic/item-319|/logic/item-320|/logic/item-' +
        '321|/logic/item-322|/logic/item-323|/logic/item-324|/logic/i' +
        'tem-325|/logic/item-326|/logic/item-327|/logic/item-328|/log' +
        'ic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected72),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected72);
      const expected73: string =
        'item-318|item-319|item-320|item-321|item-322|item-323|item-3' +
        '24|item-325|item-326|item-327|item-328|item-329|item-330|ite' +
        'm-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected73),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected73);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(14).uri));
      expect(source.getData(14).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:14'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:14');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1211
     * @tc.name MultiMedia_Delete_1211
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1211', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1211';
      LogicTestLog.begin(name, 'length=16;index=-Infinity;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 19);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1213
     * @tc.name MultiMedia_Delete_1213
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1213', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1213';
      LogicTestLog.begin(name, 'length=16;index=-18;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-18, -1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected75: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected75),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected75);
      const expected76: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected76),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected76);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1214
     * @tc.name MultiMedia_Delete_1214
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1214', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1214';
      LogicTestLog.begin(name, 'length=16;index=-18;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-18, 1);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected77: string =
        '/logic/item-317|/logic/item-318|/logic/item-319|/logic/item-' +
        '320|/logic/item-321|/logic/item-322|/logic/item-323|/logic/i' +
        'tem-324|/logic/item-325|/logic/item-326|/logic/item-327|/log' +
        'ic/item-328|/logic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected77),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected77);
      const expected78: string =
        'item-317|item-318|item-319|item-320|item-321|item-322|item-3' +
        '23|item-324|item-325|item-326|item-327|item-328|item-329|ite' +
        'm-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected78),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected78);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1215
     * @tc.name MultiMedia_Delete_1215
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1215', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1215';
      LogicTestLog.begin(name, 'length=16;index=-18;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-18, 19);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1217
     * @tc.name MultiMedia_Delete_1217
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1217', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1217';
      LogicTestLog.begin(name, 'length=16;index=-1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 0);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected80: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected80),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected80);
      const expected81: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected81),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected81);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1218
     * @tc.name MultiMedia_Delete_1218
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1218', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1218';
      LogicTestLog.begin(name, 'length=16;index=-1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 2);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected82: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected82),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected82);
      const expected83: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330';
      LogicTestLog.value(name, 'remaining name order',
        String(expected83),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected83);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1219
     * @tc.name MultiMedia_Delete_1219
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1219', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1219';
      LogicTestLog.begin(name, 'length=16;index=-1;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 19);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected84: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected84),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected84);
      const expected85: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330';
      LogicTestLog.value(name, 'remaining name order',
        String(expected85),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected85);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1221
     * @tc.name MultiMedia_Delete_1221
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1221', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1221';
      LogicTestLog.begin(name, 'length=16;index=-0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, -1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected87: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected87),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected87);
      const expected88: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected88),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected88);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1222
     * @tc.name MultiMedia_Delete_1222
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1222', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1222';
      LogicTestLog.begin(name, 'length=16;index=-0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 1);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected89: string =
        '/logic/item-317|/logic/item-318|/logic/item-319|/logic/item-' +
        '320|/logic/item-321|/logic/item-322|/logic/item-323|/logic/i' +
        'tem-324|/logic/item-325|/logic/item-326|/logic/item-327|/log' +
        'ic/item-328|/logic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected89),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected89);
      const expected90: string =
        'item-317|item-318|item-319|item-320|item-321|item-322|item-3' +
        '23|item-324|item-325|item-326|item-327|item-328|item-329|ite' +
        'm-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected90),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected90);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1223
     * @tc.name MultiMedia_Delete_1223
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1223', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1223';
      LogicTestLog.begin(name, 'length=16;index=-0.75;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 19);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1225
     * @tc.name MultiMedia_Delete_1225
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1225', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1225';
      LogicTestLog.begin(name, 'length=16;index=0;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, -1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected92: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected92),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected92);
      const expected93: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected93),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected93);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1226
     * @tc.name MultiMedia_Delete_1226
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1226', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1226';
      LogicTestLog.begin(name, 'length=16;index=0;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 1);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected94: string =
        '/logic/item-317|/logic/item-318|/logic/item-319|/logic/item-' +
        '320|/logic/item-321|/logic/item-322|/logic/item-323|/logic/i' +
        'tem-324|/logic/item-325|/logic/item-326|/logic/item-327|/log' +
        'ic/item-328|/logic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected94),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected94);
      const expected95: string =
        'item-317|item-318|item-319|item-320|item-321|item-322|item-3' +
        '23|item-324|item-325|item-326|item-327|item-328|item-329|ite' +
        'm-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected95),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected95);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1227
     * @tc.name MultiMedia_Delete_1227
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1227', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1227';
      LogicTestLog.begin(name, 'length=16;index=0;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 19);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1229
     * @tc.name MultiMedia_Delete_1229
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1229', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1229';
      LogicTestLog.begin(name, 'length=16;index=0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, -1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected97: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected97),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected97);
      const expected98: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected98),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected98);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1230
     * @tc.name MultiMedia_Delete_1230
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1230', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1230';
      LogicTestLog.begin(name, 'length=16;index=0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 1);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected99: string =
        '/logic/item-317|/logic/item-318|/logic/item-319|/logic/item-' +
        '320|/logic/item-321|/logic/item-322|/logic/item-323|/logic/i' +
        'tem-324|/logic/item-325|/logic/item-326|/logic/item-327|/log' +
        'ic/item-328|/logic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected99),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected99);
      const expected100: string =
        'item-317|item-318|item-319|item-320|item-321|item-322|item-3' +
        '23|item-324|item-325|item-326|item-327|item-328|item-329|ite' +
        'm-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected100),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected100);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1231
     * @tc.name MultiMedia_Delete_1231
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1231', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1231';
      LogicTestLog.begin(name, 'length=16;index=0.75;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 19);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1233
     * @tc.name MultiMedia_Delete_1233
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1233', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1233';
      LogicTestLog.begin(name, 'length=16;index=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 0);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected102: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected102),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected102);
      const expected103: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected103),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected103);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1234
     * @tc.name MultiMedia_Delete_1234
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1234', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1234';
      LogicTestLog.begin(name, 'length=16;index=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 2);
      LogicTestLog.number(name, 'remaining total', 14, source.totalCount());
      expect(source.totalCount()).assertEqual(14);
      LogicTestLog.number(name, 'aliased delete length', 14, original.length);
      expect(original.length).assertEqual(14);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected104: string =
        '/logic/item-316|/logic/item-319|/logic/item-320|/logic/item-' +
        '321|/logic/item-322|/logic/item-323|/logic/item-324|/logic/i' +
        'tem-325|/logic/item-326|/logic/item-327|/logic/item-328|/log' +
        'ic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected104),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected104);
      const expected105: string =
        'item-316|item-319|item-320|item-321|item-322|item-323|item-3' +
        '24|item-325|item-326|item-327|item-328|item-329|item-330|ite' +
        'm-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected105),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected105);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(14).uri));
      expect(source.getData(14).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:14'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:14');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1235
     * @tc.name MultiMedia_Delete_1235
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1235', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1235';
      LogicTestLog.begin(name, 'length=16;index=1;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 19);
      LogicTestLog.number(name, 'remaining total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased delete length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-316'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-316');
      LogicTestLog.value(name, 'remaining name order',
        String('item-316'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-316');
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1237
     * @tc.name MultiMedia_Delete_1237
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1237', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1237';
      LogicTestLog.begin(name, 'length=16;index=15;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(15, 0);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected107: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected107),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected107);
      const expected108: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected108),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected108);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1238
     * @tc.name MultiMedia_Delete_1238
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1238', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1238';
      LogicTestLog.begin(name, 'length=16;index=15;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(15, 2);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected109: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected109),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected109);
      const expected110: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330';
      LogicTestLog.value(name, 'remaining name order',
        String(expected110),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected110);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1239
     * @tc.name MultiMedia_Delete_1239
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1239', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1239';
      LogicTestLog.begin(name, 'length=16;index=15;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(15, 19);
      LogicTestLog.number(name, 'remaining total', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.number(name, 'aliased delete length', 15, original.length);
      expect(original.length).assertEqual(15);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected111: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected111),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected111);
      const expected112: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330';
      LogicTestLog.value(name, 'remaining name order',
        String(expected112),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected112);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:15'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:15');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1241
     * @tc.name MultiMedia_Delete_1241
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1241', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1241';
      LogicTestLog.begin(name, 'length=16;index=16;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(16, -1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected114: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected114),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected114);
      const expected115: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected115),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected115);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1242
     * @tc.name MultiMedia_Delete_1242
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1242', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1242';
      LogicTestLog.begin(name, 'length=16;index=16;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(16, 1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected116: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected116),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected116);
      const expected117: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected117),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected117);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1243
     * @tc.name MultiMedia_Delete_1243
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1243', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1243';
      LogicTestLog.begin(name, 'length=16;index=16;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(16, 19);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected118: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected118),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected118);
      const expected119: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected119),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected119);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1245
     * @tc.name MultiMedia_Delete_1245
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1245', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1245';
      LogicTestLog.begin(name, 'length=16;index=18;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(18, -1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected121: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected121),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected121);
      const expected122: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected122),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected122);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1246
     * @tc.name MultiMedia_Delete_1246
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1246', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1246';
      LogicTestLog.begin(name, 'length=16;index=18;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(18, 1);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected123: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected123),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected123);
      const expected124: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected124),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected124);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1247
     * @tc.name MultiMedia_Delete_1247
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1247', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1247';
      LogicTestLog.begin(name, 'length=16;index=18;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(18, 19);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected125: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected125),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected125);
      const expected126: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected126),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected126);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1249
     * @tc.name MultiMedia_Delete_1249
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1249', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1249';
      LogicTestLog.begin(name, 'length=16;index=Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 0);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected128: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected128),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected128);
      const expected129: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected129),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected129);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1250
     * @tc.name MultiMedia_Delete_1250
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1250', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1250';
      LogicTestLog.begin(name, 'length=16;index=Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 2);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected130: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected130),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected130);
      const expected131: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected131),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected131);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1251
     * @tc.name MultiMedia_Delete_1251
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1251', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1251';
      LogicTestLog.begin(name, 'length=16;index=Infinity;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 19);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected132: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected132),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected132);
      const expected133: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected133),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected133);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1253
     * @tc.name MultiMedia_Delete_1253
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1253', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1253';
      LogicTestLog.begin(name, 'length=16;index=NaN;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 0);
      LogicTestLog.number(name, 'remaining total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'aliased delete length', 16, original.length);
      expect(original.length).assertEqual(16);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected135: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected135),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected135);
      const expected136: string =
        'item-316|item-317|item-318|item-319|item-320|item-321|item-3' +
        '22|item-323|item-324|item-325|item-326|item-327|item-328|ite' +
        'm-329|item-330|item-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected136),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected136);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:16'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:16');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1254
     * @tc.name MultiMedia_Delete_1254
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1254', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1254';
      LogicTestLog.begin(name, 'length=16;index=NaN;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 2);
      LogicTestLog.number(name, 'remaining total', 14, source.totalCount());
      expect(source.totalCount()).assertEqual(14);
      LogicTestLog.number(name, 'aliased delete length', 14, original.length);
      expect(original.length).assertEqual(14);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected137: string =
        '/logic/item-318|/logic/item-319|/logic/item-320|/logic/item-' +
        '321|/logic/item-322|/logic/item-323|/logic/item-324|/logic/i' +
        'tem-325|/logic/item-326|/logic/item-327|/logic/item-328|/log' +
        'ic/item-329|/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected137),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected137);
      const expected138: string =
        'item-318|item-319|item-320|item-321|item-322|item-323|item-3' +
        '24|item-325|item-326|item-327|item-328|item-329|item-330|ite' +
        'm-331';
      LogicTestLog.value(name, 'remaining name order',
        String(expected138),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected138);
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 15, source.totalCount());
      expect(source.totalCount()).assertEqual(15);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(14).uri));
      expect(source.getData(14).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence',
        String('reload|add:14'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:14');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1255
     * @tc.name MultiMedia_Delete_1255
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1255', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1255';
      LogicTestLog.begin(name, 'length=16;index=NaN;remove=19');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 19);
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
  });
}
