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

export default function DataSourceListenerLogic(): void {
  describe('DataSourceListenerLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1256
     * @tc.name MultiMedia_Listener_1256
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1256', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1256';
      LogicTestLog.begin(name, 'listeners=0;repeat=1;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1257
     * @tc.name MultiMedia_Listener_1257
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1257', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1257';
      LogicTestLog.begin(name, 'listeners=0;repeat=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1258
     * @tc.name MultiMedia_Listener_1258
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1258', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1258';
      LogicTestLog.begin(name, 'listeners=0;repeat=1;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1259
     * @tc.name MultiMedia_Listener_1259
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1259', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1259';
      LogicTestLog.begin(name, 'listeners=0;repeat=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1260
     * @tc.name MultiMedia_Listener_1260
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1260', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1260';
      LogicTestLog.begin(name, 'listeners=0;repeat=2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1261
     * @tc.name MultiMedia_Listener_1261
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1261', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1261';
      LogicTestLog.begin(name, 'listeners=0;repeat=2;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1262
     * @tc.name MultiMedia_Listener_1262
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1262', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1262';
      LogicTestLog.begin(name, 'listeners=0;repeat=2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1263
     * @tc.name MultiMedia_Listener_1263
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1263', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1263';
      LogicTestLog.begin(name, 'listeners=0;repeat=2;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1264
     * @tc.name MultiMedia_Listener_1264
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1264', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1264';
      LogicTestLog.begin(name, 'listeners=0;repeat=5;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1265
     * @tc.name MultiMedia_Listener_1265
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1265', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1265';
      LogicTestLog.begin(name, 'listeners=0;repeat=5;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1266
     * @tc.name MultiMedia_Listener_1266
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1266', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1266';
      LogicTestLog.begin(name, 'listeners=0;repeat=5;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1267
     * @tc.name MultiMedia_Listener_1267
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1267', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1267';
      LogicTestLog.begin(name, 'listeners=0;repeat=5;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 0; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String(''), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1268
     * @tc.name MultiMedia_Listener_1268
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1268', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1268';
      LogicTestLog.begin(name, 'listeners=1;repeat=1;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1269
     * @tc.name MultiMedia_Listener_1269
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1269', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1269';
      LogicTestLog.begin(name, 'listeners=1;repeat=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1270
     * @tc.name MultiMedia_Listener_1270
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1270', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1270';
      LogicTestLog.begin(name, 'listeners=1;repeat=1;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1271
     * @tc.name MultiMedia_Listener_1271
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1271', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1271';
      LogicTestLog.begin(name, 'listeners=1;repeat=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1272
     * @tc.name MultiMedia_Listener_1272
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1272', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1272';
      LogicTestLog.begin(name, 'listeners=1;repeat=2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1273
     * @tc.name MultiMedia_Listener_1273
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1273', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1273';
      LogicTestLog.begin(name, 'listeners=1;repeat=2;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1274
     * @tc.name MultiMedia_Listener_1274
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1274', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1274';
      LogicTestLog.begin(name, 'listeners=1;repeat=2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1275
     * @tc.name MultiMedia_Listener_1275
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1275', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1275';
      LogicTestLog.begin(name, 'listeners=1;repeat=2;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1276
     * @tc.name MultiMedia_Listener_1276
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1276', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1276';
      LogicTestLog.begin(name, 'listeners=1;repeat=5;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1277
     * @tc.name MultiMedia_Listener_1277
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1277', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1277';
      LogicTestLog.begin(name, 'listeners=1;repeat=5;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1278
     * @tc.name MultiMedia_Listener_1278
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1278', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1278';
      LogicTestLog.begin(name, 'listeners=1;repeat=5;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1279
     * @tc.name MultiMedia_Listener_1279
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1279', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1279';
      LogicTestLog.begin(name, 'listeners=1;repeat=5;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 1; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String(''), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1280
     * @tc.name MultiMedia_Listener_1280
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1280', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1280';
      LogicTestLog.begin(name, 'listeners=2;repeat=1;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1281
     * @tc.name MultiMedia_Listener_1281
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1281', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1281';
      LogicTestLog.begin(name, 'listeners=2;repeat=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1282
     * @tc.name MultiMedia_Listener_1282
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1282', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1282';
      LogicTestLog.begin(name, 'listeners=2;repeat=1;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1283
     * @tc.name MultiMedia_Listener_1283
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1283', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1283';
      LogicTestLog.begin(name, 'listeners=2;repeat=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1284
     * @tc.name MultiMedia_Listener_1284
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1284', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1284';
      LogicTestLog.begin(name, 'listeners=2;repeat=2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1285
     * @tc.name MultiMedia_Listener_1285
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1285', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1285';
      LogicTestLog.begin(name, 'listeners=2;repeat=2;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1286
     * @tc.name MultiMedia_Listener_1286
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1286', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1286';
      LogicTestLog.begin(name, 'listeners=2;repeat=2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1287
     * @tc.name MultiMedia_Listener_1287
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1287', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1287';
      LogicTestLog.begin(name, 'listeners=2;repeat=2;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1288
     * @tc.name MultiMedia_Listener_1288
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1288', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1288';
      LogicTestLog.begin(name, 'listeners=2;repeat=5;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1289
     * @tc.name MultiMedia_Listener_1289
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1289', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1289';
      LogicTestLog.begin(name, 'listeners=2;repeat=5;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1290
     * @tc.name MultiMedia_Listener_1290
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1290', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1290';
      LogicTestLog.begin(name, 'listeners=2;repeat=5;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1291
     * @tc.name MultiMedia_Listener_1291
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1291', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1291';
      LogicTestLog.begin(name, 'listeners=2;repeat=5;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 2; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String(''), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1292
     * @tc.name MultiMedia_Listener_1292
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1292', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1292';
      LogicTestLog.begin(name, 'listeners=3;repeat=1;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1293
     * @tc.name MultiMedia_Listener_1293
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1293', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1293';
      LogicTestLog.begin(name, 'listeners=3;repeat=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1294
     * @tc.name MultiMedia_Listener_1294
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1294', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1294';
      LogicTestLog.begin(name, 'listeners=3;repeat=1;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1295
     * @tc.name MultiMedia_Listener_1295
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1295', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1295';
      LogicTestLog.begin(name, 'listeners=3;repeat=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 1; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1296
     * @tc.name MultiMedia_Listener_1296
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1296', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1296';
      LogicTestLog.begin(name, 'listeners=3;repeat=2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1297
     * @tc.name MultiMedia_Listener_1297
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1297', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1297';
      LogicTestLog.begin(name, 'listeners=3;repeat=2;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1298
     * @tc.name MultiMedia_Listener_1298
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1298', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1298';
      LogicTestLog.begin(name, 'listeners=3;repeat=2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1299
     * @tc.name MultiMedia_Listener_1299
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1299', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1299';
      LogicTestLog.begin(name, 'listeners=3;repeat=2;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 2; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1300
     * @tc.name MultiMedia_Listener_1300
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1300', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1300';
      LogicTestLog.begin(name, 'listeners=3;repeat=5;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(new DataSourceProbe());
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1301
     * @tc.name MultiMedia_Listener_1301
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1301', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1301';
      LogicTestLog.begin(name, 'listeners=3;repeat=5;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[0]);
      source.unregisterDataChangeListener(probes[0]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1302
     * @tc.name MultiMedia_Listener_1302
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1302', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1302';
      LogicTestLog.begin(name, 'listeners=3;repeat=5;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[1]);
      source.unregisterDataChangeListener(probes[1]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1303
     * @tc.name MultiMedia_Listener_1303
     * @tc.desc Listener identity deduplication and repeated or absent deregistration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Listener_1303', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Listener_1303';
      LogicTestLog.begin(name, 'listeners=3;repeat=5;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const first: DataSourceProbe = new DataSourceProbe();
      const second: DataSourceProbe = new DataSourceProbe();
      const third: DataSourceProbe = new DataSourceProbe();
      const probes: DataSourceProbe[] = [first, second, third];
      for (let index: number = 0; index < 3; index++) {
        for (let duplicate: number = 0; duplicate < 5; duplicate++) {
          source.registerDataChangeListener(probes[index]);
        }
      }
      source.notifyDataReload();
      LogicTestLog.value(name, 'probe0 dedup', String('reload'), String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe1 dedup', String('reload'), String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload');
      LogicTestLog.value(name, 'probe2 dedup', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      source.unregisterDataChangeListener(probes[2]);
      source.unregisterDataChangeListener(probes[2]);
      source.notifyDataChange(7);
      source.notifyDataDelete(-1);
      source.notifyDataMove(3, 1);
      LogicTestLog.value(name, 'probe0 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[0].events.join('|')));
      expect(probes[0].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe1 removal and sequence',
        String('reload|change:7|delete:-1|move:3:1'),
        String(probes[1].events.join('|')));
      expect(probes[1].events.join('|')).assertEqual('reload|change:7|delete:-1|move:3:1');
      LogicTestLog.value(name, 'probe2 removal and sequence', String('reload'), String(probes[2].events.join('|')));
      expect(probes[2].events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'notifications do not insert data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });
  });
}
