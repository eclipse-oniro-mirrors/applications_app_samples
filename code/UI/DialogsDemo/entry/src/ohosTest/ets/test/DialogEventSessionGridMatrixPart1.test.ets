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

export default function DialogEventSessionGridMatrixPart1Test(): void {
  describe('DialogEventSessionGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0100
     * @tc.name      testSessionGrid0001
     * @tc.desc      Verify scene 1 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0001 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 0');
      log.record('select#1 index=1');
      log.record('click#1');
      log.record('close#1 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 0');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 0|select#1 index=1|click#1|close#1 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0200
     * @tc.name      testSessionGrid0002
     * @tc.desc      Verify scene 1 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0002 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 1');
      log.record('check#1 checked=false');
      log.record('error#1 code2');
      log.record('close#1 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 1');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 1|check#1 checked=false|error#1 code2|close#1 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0300
     * @tc.name      testSessionGrid0003
     * @tc.desc      Verify scene 1 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0003 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 2');
      log.record('select#1 index=1');
      log.record('select#1 index=2');
      log.record('click#1');
      log.record('close#1 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#1 scene 2');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 2|select#1 index=1|select#1 index=2|click#1|close#1 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0400
     * @tc.name      testSessionGrid0004
     * @tc.desc      Verify scene 1 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0004 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 3');
      log.record('error#1 code1');
      log.record('click#1');
      log.record('close#1 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 3');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 3|error#1 code1|click#1|close#1 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0500
     * @tc.name      testSessionGrid0005
     * @tc.desc      Verify scene 1 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0005 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 4');
      log.record('click#1');
      log.record('close#1 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#1 scene 4');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 4|click#1|close#1 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0600
     * @tc.name      testSessionGrid0006
     * @tc.desc      Verify scene 1 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0006 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 5');
      log.record('check#1 checked=false');
      log.record('check#1 checked=true');
      log.record('close#1 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 5');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 5|check#1 checked=false|check#1 checked=true|close#1 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0700
     * @tc.name      testSessionGrid0007
     * @tc.desc      Verify scene 1 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0007 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 6');
      log.record('select#1 index=1');
      log.record('check#1 checked=true');
      log.record('error#1 code3');
      log.record('close#1 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#1 scene 6');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 6|select#1 index=1|check#1 checked=true|error#1 code3|close#1 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0800
     * @tc.name      testSessionGrid0008
     * @tc.desc      Verify scene 1 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0008 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 7');
      log.record('click#1');
      log.record('select#1 index=2');
      log.record('close#1 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 7');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 7|click#1|select#1 index=2|close#1 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_0900
     * @tc.name      testSessionGrid0009
     * @tc.desc      Verify scene 1 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0009 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 8');
      log.record('error#1 code1');
      log.record('error#1 code2');
      log.record('close#1 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 8');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 8|error#1 code1|error#1 code2|close#1 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1000
     * @tc.name      testSessionGrid0010
     * @tc.desc      Verify scene 1 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0010 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 9');
      log.record('select#1 index=1');
      log.record('click#1');
      log.record('check#1 checked=false');
      log.record('close#1 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#1 scene 9');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 9|select#1 index=1|click#1|check#1 checked=false|close#1 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1100
     * @tc.name      testSessionGrid0011
     * @tc.desc      Verify scene 1 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0011 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 10');
      log.record('check#1 checked=false');
      log.record('click#1');
      log.record('close#1 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#1 scene 10');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 10|check#1 checked=false|click#1|close#1 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1200
     * @tc.name      testSessionGrid0012
     * @tc.desc      Verify scene 1 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0012 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 scene 11');
      log.record('select#1 index=1');
      log.record('error#1 code2');
      log.record('click#1');
      log.record('close#1 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#1 scene 11');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#1 scene 11|select#1 index=1|error#1 code2|click#1|close#1 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1300
     * @tc.name      testSessionGrid0013
     * @tc.desc      Verify scene 2 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0013 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 0');
      log.record('select#2 index=1');
      log.record('click#2');
      log.record('close#2 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 0');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 0|select#2 index=1|click#2|close#2 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1400
     * @tc.name      testSessionGrid0014
     * @tc.desc      Verify scene 2 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0014 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 1');
      log.record('check#2 checked=false');
      log.record('error#2 code2');
      log.record('close#2 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 1');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 1|check#2 checked=false|error#2 code2|close#2 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1500
     * @tc.name      testSessionGrid0015
     * @tc.desc      Verify scene 2 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0015 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 2');
      log.record('select#2 index=1');
      log.record('select#2 index=2');
      log.record('click#2');
      log.record('close#2 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#2 scene 2');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 2|select#2 index=1|select#2 index=2|click#2|close#2 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1600
     * @tc.name      testSessionGrid0016
     * @tc.desc      Verify scene 2 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0016 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 3');
      log.record('error#2 code1');
      log.record('click#2');
      log.record('close#2 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 3');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 3|error#2 code1|click#2|close#2 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1700
     * @tc.name      testSessionGrid0017
     * @tc.desc      Verify scene 2 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0017 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 4');
      log.record('click#2');
      log.record('close#2 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#2 scene 4');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 4|click#2|close#2 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1800
     * @tc.name      testSessionGrid0018
     * @tc.desc      Verify scene 2 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0018 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 5');
      log.record('check#2 checked=false');
      log.record('check#2 checked=true');
      log.record('close#2 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 5');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 5|check#2 checked=false|check#2 checked=true|close#2 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_1900
     * @tc.name      testSessionGrid0019
     * @tc.desc      Verify scene 2 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0019 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 6');
      log.record('select#2 index=1');
      log.record('check#2 checked=true');
      log.record('error#2 code3');
      log.record('close#2 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#2 scene 6');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 6|select#2 index=1|check#2 checked=true|error#2 code3|close#2 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0019 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2000
     * @tc.name      testSessionGrid0020
     * @tc.desc      Verify scene 2 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0020 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 7');
      log.record('click#2');
      log.record('select#2 index=2');
      log.record('close#2 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 7');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 7|click#2|select#2 index=2|close#2 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0020 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2100
     * @tc.name      testSessionGrid0021
     * @tc.desc      Verify scene 2 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0021 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 8');
      log.record('error#2 code1');
      log.record('error#2 code2');
      log.record('close#2 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 8');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 8|error#2 code1|error#2 code2|close#2 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0021 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2200
     * @tc.name      testSessionGrid0022
     * @tc.desc      Verify scene 2 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0022 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 9');
      log.record('select#2 index=1');
      log.record('click#2');
      log.record('check#2 checked=false');
      log.record('close#2 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#2 scene 9');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 9|select#2 index=1|click#2|check#2 checked=false|close#2 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0022 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2300
     * @tc.name      testSessionGrid0023
     * @tc.desc      Verify scene 2 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0023 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 10');
      log.record('check#2 checked=false');
      log.record('click#2');
      log.record('close#2 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#2 scene 10');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 10|check#2 checked=false|click#2|close#2 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0023 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2400
     * @tc.name      testSessionGrid0024
     * @tc.desc      Verify scene 2 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0024 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#2 scene 11');
      log.record('select#2 index=1');
      log.record('error#2 code2');
      log.record('click#2');
      log.record('close#2 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#2 scene 11');
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#2 scene 11|select#2 index=1|error#2 code2|click#2|close#2 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0024 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2500
     * @tc.name      testSessionGrid0025
     * @tc.desc      Verify scene 3 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0025 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 0');
      log.record('select#3 index=1');
      log.record('click#3');
      log.record('close#3 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 0');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 0|select#3 index=1|click#3|close#3 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0025 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2600
     * @tc.name      testSessionGrid0026
     * @tc.desc      Verify scene 3 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0026 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 1');
      log.record('check#3 checked=false');
      log.record('error#3 code2');
      log.record('close#3 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 1');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 1|check#3 checked=false|error#3 code2|close#3 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0026 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2700
     * @tc.name      testSessionGrid0027
     * @tc.desc      Verify scene 3 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0027 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 2');
      log.record('select#3 index=1');
      log.record('select#3 index=2');
      log.record('click#3');
      log.record('close#3 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#3 scene 2');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 2|select#3 index=1|select#3 index=2|click#3|close#3 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0027 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2800
     * @tc.name      testSessionGrid0028
     * @tc.desc      Verify scene 3 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0028 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 3');
      log.record('error#3 code1');
      log.record('click#3');
      log.record('close#3 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 3');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 3|error#3 code1|click#3|close#3 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0028 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_2900
     * @tc.name      testSessionGrid0029
     * @tc.desc      Verify scene 3 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0029 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 4');
      log.record('click#3');
      log.record('close#3 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#3 scene 4');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 4|click#3|close#3 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0029 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3000
     * @tc.name      testSessionGrid0030
     * @tc.desc      Verify scene 3 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0030 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 5');
      log.record('check#3 checked=false');
      log.record('check#3 checked=true');
      log.record('close#3 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 5');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 5|check#3 checked=false|check#3 checked=true|close#3 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0030 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3100
     * @tc.name      testSessionGrid0031
     * @tc.desc      Verify scene 3 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0031 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 6');
      log.record('select#3 index=1');
      log.record('check#3 checked=true');
      log.record('error#3 code3');
      log.record('close#3 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#3 scene 6');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 6|select#3 index=1|check#3 checked=true|error#3 code3|close#3 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0031 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3200
     * @tc.name      testSessionGrid0032
     * @tc.desc      Verify scene 3 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0032 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 7');
      log.record('click#3');
      log.record('select#3 index=2');
      log.record('close#3 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 7');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 7|click#3|select#3 index=2|close#3 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0032 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3300
     * @tc.name      testSessionGrid0033
     * @tc.desc      Verify scene 3 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0033 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 8');
      log.record('error#3 code1');
      log.record('error#3 code2');
      log.record('close#3 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 8');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 8|error#3 code1|error#3 code2|close#3 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0033 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3400
     * @tc.name      testSessionGrid0034
     * @tc.desc      Verify scene 3 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0034 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 9');
      log.record('select#3 index=1');
      log.record('click#3');
      log.record('check#3 checked=false');
      log.record('close#3 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#3 scene 9');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 9|select#3 index=1|click#3|check#3 checked=false|close#3 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0034 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3500
     * @tc.name      testSessionGrid0035
     * @tc.desc      Verify scene 3 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0035 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 10');
      log.record('check#3 checked=false');
      log.record('click#3');
      log.record('close#3 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#3 scene 10');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 10|check#3 checked=false|click#3|close#3 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0035 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3600
     * @tc.name      testSessionGrid0036
     * @tc.desc      Verify scene 3 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0036 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#3 scene 11');
      log.record('select#3 index=1');
      log.record('error#3 code2');
      log.record('click#3');
      log.record('close#3 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#3 scene 11');
      expect(log.hasPrefix('open#3')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#3 scene 11|select#3 index=1|error#3 code2|click#3|close#3 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0036 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3700
     * @tc.name      testSessionGrid0037
     * @tc.desc      Verify scene 4 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0037 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 0');
      log.record('select#4 index=1');
      log.record('click#4');
      log.record('close#4 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 0');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 0|select#4 index=1|click#4|close#4 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0037 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3800
     * @tc.name      testSessionGrid0038
     * @tc.desc      Verify scene 4 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0038 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 1');
      log.record('check#4 checked=false');
      log.record('error#4 code2');
      log.record('close#4 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 1');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 1|check#4 checked=false|error#4 code2|close#4 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0038 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_3900
     * @tc.name      testSessionGrid0039
     * @tc.desc      Verify scene 4 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0039 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 2');
      log.record('select#4 index=1');
      log.record('select#4 index=2');
      log.record('click#4');
      log.record('close#4 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#4 scene 2');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 2|select#4 index=1|select#4 index=2|click#4|close#4 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0039 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP1_4000
     * @tc.name      testSessionGrid0040
     * @tc.desc      Verify scene 4 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0040 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 3');
      log.record('error#4 code1');
      log.record('click#4');
      log.record('close#4 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 3');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 3|error#4 code1|click#4|close#4 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0040 end');
    })

  })
}
