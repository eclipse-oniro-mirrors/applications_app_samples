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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { DialogEventLog } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogEventSequenceGridMatrixPart1Test(): void {
  describe('DialogEventSequenceGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0100
     * @tc.name      testCapacityGrid0001
     * @tc.desc      Verify event log capacity with 0 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0001 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      expect(log.count()).assertEqual(0);
      expect(log.toLines().length).assertEqual(0);
      expect(log.last()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0200
     * @tc.name      testCapacityGrid0002
     * @tc.desc      Verify event log capacity with 1 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0002 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 1; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(1);
      expect(log.toLines().length).assertEqual(1);
      expect(log.last()).assertEqual('event-0');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0300
     * @tc.name      testCapacityGrid0003
     * @tc.desc      Verify event log capacity with 2 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0003 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 2; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(2);
      expect(log.toLines().length).assertEqual(2);
      expect(log.last()).assertEqual('event-1');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0400
     * @tc.name      testCapacityGrid0004
     * @tc.desc      Verify event log capacity with 3 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0004 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 3; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(3);
      expect(log.toLines().length).assertEqual(3);
      expect(log.last()).assertEqual('event-2');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0500
     * @tc.name      testCapacityGrid0005
     * @tc.desc      Verify event log capacity with 10 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0005 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 10; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(10);
      expect(log.toLines().length).assertEqual(10);
      expect(log.last()).assertEqual('event-9');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0600
     * @tc.name      testCapacityGrid0006
     * @tc.desc      Verify event log capacity with 30 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0006 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 30; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(30);
      expect(log.toLines().length).assertEqual(30);
      expect(log.last()).assertEqual('event-29');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0700
     * @tc.name      testCapacityGrid0007
     * @tc.desc      Verify event log capacity with 58 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0007 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 58; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(58);
      expect(log.toLines().length).assertEqual(58);
      expect(log.last()).assertEqual('event-57');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0800
     * @tc.name      testCapacityGrid0008
     * @tc.desc      Verify event log capacity with 59 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0008 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 59; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(59);
      expect(log.toLines().length).assertEqual(59);
      expect(log.last()).assertEqual('event-58');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_0900
     * @tc.name      testCapacityGrid0009
     * @tc.desc      Verify event log capacity with 60 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0009 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 60; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-59');
      expect(log.toLines()[0]).assertEqual('event-0');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1000
     * @tc.name      testCapacityGrid0010
     * @tc.desc      Verify event log capacity with 61 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0010 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 61; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-60');
      expect(log.toLines()[0]).assertEqual('event-1');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1100
     * @tc.name      testCapacityGrid0011
     * @tc.desc      Verify event log capacity with 62 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0011 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 62; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-61');
      expect(log.toLines()[0]).assertEqual('event-2');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1200
     * @tc.name      testCapacityGrid0012
     * @tc.desc      Verify event log capacity with 65 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0012 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 65; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-64');
      expect(log.toLines()[0]).assertEqual('event-5');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1300
     * @tc.name      testCapacityGrid0013
     * @tc.desc      Verify event log capacity with 70 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0013 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 70; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-69');
      expect(log.toLines()[0]).assertEqual('event-10');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1400
     * @tc.name      testCapacityGrid0014
     * @tc.desc      Verify event log capacity with 80 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0014 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 80; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-79');
      expect(log.toLines()[0]).assertEqual('event-20');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1500
     * @tc.name      testCapacityGrid0015
     * @tc.desc      Verify event log capacity with 100 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacityGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0015 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 100; i++) {
        log.record('event-' + i);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines().length).assertEqual(60);
      expect(log.last()).assertEqual('event-99');
      expect(log.toLines()[0]).assertEqual('event-40');
      expect(log.hasPrefix('event-')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacityGrid0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1600
     * @tc.name      testPrefixGrid0016
     * @tc.desc      Verify hasPrefix 'open#1' vs 'open#1x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0016 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 confirm');
      log.record('tail-0');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('open#1x')).assertFalse();
      expect(log.last()).assertEqual('tail-0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1700
     * @tc.name      testPrefixGrid0017
     * @tc.desc      Verify hasPrefix 'open#1' vs 'open#99'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0017 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 confirm');
      log.record('tail-0');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('open#99')).assertFalse();
      expect(log.last()).assertEqual('tail-0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1800
     * @tc.name      testPrefixGrid0018
     * @tc.desc      Verify hasPrefix 'open#1' vs 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0018 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 confirm');
      log.record('tail-0');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('missing')).assertFalse();
      expect(log.last()).assertEqual('tail-0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_1900
     * @tc.name      testPrefixGrid0019
     * @tc.desc      Verify hasPrefix 'close#2' vs 'close#2x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0019 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('close#2 alert');
      log.record('tail-1');
      expect(log.hasPrefix('close#2')).assertTrue();
      expect(log.hasPrefix('close#2x')).assertFalse();
      expect(log.last()).assertEqual('tail-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0019 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2000
     * @tc.name      testPrefixGrid0020
     * @tc.desc      Verify hasPrefix 'close#2' vs 'open#99'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0020 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('close#2 alert');
      log.record('tail-1');
      expect(log.hasPrefix('close#2')).assertTrue();
      expect(log.hasPrefix('open#99')).assertFalse();
      expect(log.last()).assertEqual('tail-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0020 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2100
     * @tc.name      testPrefixGrid0021
     * @tc.desc      Verify hasPrefix 'close#2' vs 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0021 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('close#2 alert');
      log.record('tail-1');
      expect(log.hasPrefix('close#2')).assertTrue();
      expect(log.hasPrefix('missing')).assertFalse();
      expect(log.last()).assertEqual('tail-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0021 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2200
     * @tc.name      testPrefixGrid0022
     * @tc.desc      Verify hasPrefix 'select#3' vs 'select#3x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0022 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('select#3 index=0');
      log.record('tail-2');
      expect(log.hasPrefix('select#3')).assertTrue();
      expect(log.hasPrefix('select#3x')).assertFalse();
      expect(log.last()).assertEqual('tail-2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0022 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2300
     * @tc.name      testPrefixGrid0023
     * @tc.desc      Verify hasPrefix 'select#3' vs 'open#99'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0023 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('select#3 index=0');
      log.record('tail-2');
      expect(log.hasPrefix('select#3')).assertTrue();
      expect(log.hasPrefix('open#99')).assertFalse();
      expect(log.last()).assertEqual('tail-2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0023 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2400
     * @tc.name      testPrefixGrid0024
     * @tc.desc      Verify hasPrefix 'select#3' vs 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0024 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('select#3 index=0');
      log.record('tail-2');
      expect(log.hasPrefix('select#3')).assertTrue();
      expect(log.hasPrefix('missing')).assertFalse();
      expect(log.last()).assertEqual('tail-2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0024 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2500
     * @tc.name      testPrefixGrid0025
     * @tc.desc      Verify hasPrefix 'check#4' vs 'check#4x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0025 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('check#4 checked=true');
      log.record('tail-3');
      expect(log.hasPrefix('check#4')).assertTrue();
      expect(log.hasPrefix('check#4x')).assertFalse();
      expect(log.last()).assertEqual('tail-3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0025 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2600
     * @tc.name      testPrefixGrid0026
     * @tc.desc      Verify hasPrefix 'check#4' vs 'open#99'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0026 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('check#4 checked=true');
      log.record('tail-3');
      expect(log.hasPrefix('check#4')).assertTrue();
      expect(log.hasPrefix('open#99')).assertFalse();
      expect(log.last()).assertEqual('tail-3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0026 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2700
     * @tc.name      testPrefixGrid0027
     * @tc.desc      Verify hasPrefix 'check#4' vs 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0027 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('check#4 checked=true');
      log.record('tail-3');
      expect(log.hasPrefix('check#4')).assertTrue();
      expect(log.hasPrefix('missing')).assertFalse();
      expect(log.last()).assertEqual('tail-3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0027 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2800
     * @tc.name      testPrefixGrid0028
     * @tc.desc      Verify hasPrefix 'click#5' vs 'click#5x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0028 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('click#5');
      log.record('tail-4');
      expect(log.hasPrefix('click#5')).assertTrue();
      expect(log.hasPrefix('click#5x')).assertFalse();
      expect(log.last()).assertEqual('tail-4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0028 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_2900
     * @tc.name      testPrefixGrid0029
     * @tc.desc      Verify hasPrefix 'click#5' vs 'open#99'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0029 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('click#5');
      log.record('tail-4');
      expect(log.hasPrefix('click#5')).assertTrue();
      expect(log.hasPrefix('open#99')).assertFalse();
      expect(log.last()).assertEqual('tail-4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0029 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3000
     * @tc.name      testPrefixGrid0030
     * @tc.desc      Verify hasPrefix 'click#5' vs 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0030 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('click#5');
      log.record('tail-4');
      expect(log.hasPrefix('click#5')).assertTrue();
      expect(log.hasPrefix('missing')).assertFalse();
      expect(log.last()).assertEqual('tail-4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0030 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3100
     * @tc.name      testPrefixGrid0031
     * @tc.desc      Verify hasPrefix 'error#6' vs 'error#6x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0031 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('error#6 rejected');
      log.record('tail-5');
      expect(log.hasPrefix('error#6')).assertTrue();
      expect(log.hasPrefix('error#6x')).assertFalse();
      expect(log.last()).assertEqual('tail-5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0031 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3200
     * @tc.name      testPrefixGrid0032
     * @tc.desc      Verify hasPrefix 'error#6' vs 'open#99'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0032 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('error#6 rejected');
      log.record('tail-5');
      expect(log.hasPrefix('error#6')).assertTrue();
      expect(log.hasPrefix('open#99')).assertFalse();
      expect(log.last()).assertEqual('tail-5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0032 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3300
     * @tc.name      testPrefixGrid0033
     * @tc.desc      Verify hasPrefix 'error#6' vs 'missing'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPrefixGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0033 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('error#6 rejected');
      log.record('tail-5');
      expect(log.hasPrefix('error#6')).assertTrue();
      expect(log.hasPrefix('missing')).assertFalse();
      expect(log.last()).assertEqual('tail-5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrefixGrid0033 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3400
     * @tc.name      testSequenceGrid0034
     * @tc.desc      Verify event sequence 1 keeps order and prefix.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSequenceGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0034 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 confirm');
      log.record('select#1 index=0');
      log.record('click#1');
      log.record('close#1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 confirm|select#1 index=0|click#1|close#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0034 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3500
     * @tc.name      testSequenceGrid0035
     * @tc.desc      Verify event sequence 2 keeps order and prefix.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSequenceGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0035 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 detail');
      log.record('check#2 checked=true');
      log.record('close#2');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#2');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 detail|check#2 checked=true|close#2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0035 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3600
     * @tc.name      testSequenceGrid0036
     * @tc.desc      Verify event sequence 3 keeps order and prefix.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSequenceGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0036 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 pick');
      log.record('select#3 index=2');
      log.record('select#3 index=1');
      log.record('click#3');
      log.record('close#3');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#3');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 pick|select#3 index=2|select#3 index=1|click#3|close#3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0036 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3700
     * @tc.name      testSequenceGrid0037
     * @tc.desc      Verify event sequence 4 keeps order and prefix.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSequenceGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0037 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 tips');
      log.record('check#4 checked=false');
      log.record('error#4 denied');
      log.record('close#4');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 tips|check#4 checked=false|error#4 denied|close#4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0037 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3800
     * @tc.name      testSequenceGrid0038
     * @tc.desc      Verify event sequence 5 keeps order and prefix.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSequenceGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0038 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 loading');
      log.record('click#5');
      log.record('close#5');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#5');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 loading|click#5|close#5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0038 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_3900
     * @tc.name      testSequenceGrid0039
     * @tc.desc      Verify event sequence 6 keeps order and prefix.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSequenceGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0039 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 custom');
      log.record('error#6 retry');
      log.record('click#6');
      log.record('close#6');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 custom|error#6 retry|click#6|close#6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSequenceGrid0039 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP1_4000
     * @tc.name      testClearGrid0040
     * @tc.desc      Verify clear after 1 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0040 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 1; i++) {
        log.record('open#' + i);
      }
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual("");
      expect(log.hasPrefix("open#")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0040 end');
    })

  })
}
