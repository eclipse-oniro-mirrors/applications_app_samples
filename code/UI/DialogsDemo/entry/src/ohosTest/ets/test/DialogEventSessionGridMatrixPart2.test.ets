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

export default function DialogEventSessionGridMatrixPart2Test(): void {
  describe('DialogEventSessionGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4100
     * @tc.name      testSessionGrid0041
     * @tc.desc      Verify scene 4 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0041 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 4');
      log.record('click#4');
      log.record('close#4 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#4 scene 4');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 4|click#4|close#4 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0041 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4200
     * @tc.name      testSessionGrid0042
     * @tc.desc      Verify scene 4 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0042 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 5');
      log.record('check#4 checked=false');
      log.record('check#4 checked=true');
      log.record('close#4 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 5');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 5|check#4 checked=false|check#4 checked=true|close#4 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0042 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4300
     * @tc.name      testSessionGrid0043
     * @tc.desc      Verify scene 4 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0043 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 6');
      log.record('select#4 index=1');
      log.record('check#4 checked=true');
      log.record('error#4 code3');
      log.record('close#4 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#4 scene 6');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 6|select#4 index=1|check#4 checked=true|error#4 code3|close#4 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0043 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4400
     * @tc.name      testSessionGrid0044
     * @tc.desc      Verify scene 4 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0044 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 7');
      log.record('click#4');
      log.record('select#4 index=2');
      log.record('close#4 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 7');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 7|click#4|select#4 index=2|close#4 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0044 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4500
     * @tc.name      testSessionGrid0045
     * @tc.desc      Verify scene 4 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0045 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 8');
      log.record('error#4 code1');
      log.record('error#4 code2');
      log.record('close#4 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 8');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 8|error#4 code1|error#4 code2|close#4 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0045 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4600
     * @tc.name      testSessionGrid0046
     * @tc.desc      Verify scene 4 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0046 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 9');
      log.record('select#4 index=1');
      log.record('click#4');
      log.record('check#4 checked=false');
      log.record('close#4 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#4 scene 9');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 9|select#4 index=1|click#4|check#4 checked=false|close#4 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0046 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4700
     * @tc.name      testSessionGrid0047
     * @tc.desc      Verify scene 4 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0047 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 10');
      log.record('check#4 checked=false');
      log.record('click#4');
      log.record('close#4 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#4 scene 10');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 10|check#4 checked=false|click#4|close#4 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0047 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4800
     * @tc.name      testSessionGrid0048
     * @tc.desc      Verify scene 4 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0048 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 scene 11');
      log.record('select#4 index=1');
      log.record('error#4 code2');
      log.record('click#4');
      log.record('close#4 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#4 scene 11');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#4 scene 11|select#4 index=1|error#4 code2|click#4|close#4 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0048 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_4900
     * @tc.name      testSessionGrid0049
     * @tc.desc      Verify scene 5 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0049 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 0');
      log.record('select#5 index=1');
      log.record('click#5');
      log.record('close#5 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 0');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 0|select#5 index=1|click#5|close#5 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0049 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5000
     * @tc.name      testSessionGrid0050
     * @tc.desc      Verify scene 5 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0050 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 1');
      log.record('check#5 checked=false');
      log.record('error#5 code2');
      log.record('close#5 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 1');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 1|check#5 checked=false|error#5 code2|close#5 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0050 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5100
     * @tc.name      testSessionGrid0051
     * @tc.desc      Verify scene 5 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0051 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 2');
      log.record('select#5 index=1');
      log.record('select#5 index=2');
      log.record('click#5');
      log.record('close#5 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#5 scene 2');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 2|select#5 index=1|select#5 index=2|click#5|close#5 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0051 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5200
     * @tc.name      testSessionGrid0052
     * @tc.desc      Verify scene 5 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0052 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 3');
      log.record('error#5 code1');
      log.record('click#5');
      log.record('close#5 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 3');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 3|error#5 code1|click#5|close#5 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0052 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5300
     * @tc.name      testSessionGrid0053
     * @tc.desc      Verify scene 5 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0053 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 4');
      log.record('click#5');
      log.record('close#5 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#5 scene 4');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 4|click#5|close#5 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0053 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5400
     * @tc.name      testSessionGrid0054
     * @tc.desc      Verify scene 5 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0054 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 5');
      log.record('check#5 checked=false');
      log.record('check#5 checked=true');
      log.record('close#5 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 5');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 5|check#5 checked=false|check#5 checked=true|close#5 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0054 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5500
     * @tc.name      testSessionGrid0055
     * @tc.desc      Verify scene 5 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0055 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 6');
      log.record('select#5 index=1');
      log.record('check#5 checked=true');
      log.record('error#5 code3');
      log.record('close#5 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#5 scene 6');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 6|select#5 index=1|check#5 checked=true|error#5 code3|close#5 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0055 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5600
     * @tc.name      testSessionGrid0056
     * @tc.desc      Verify scene 5 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0056 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 7');
      log.record('click#5');
      log.record('select#5 index=2');
      log.record('close#5 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 7');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 7|click#5|select#5 index=2|close#5 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0056 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5700
     * @tc.name      testSessionGrid0057
     * @tc.desc      Verify scene 5 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0057 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 8');
      log.record('error#5 code1');
      log.record('error#5 code2');
      log.record('close#5 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 8');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 8|error#5 code1|error#5 code2|close#5 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0057 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5800
     * @tc.name      testSessionGrid0058
     * @tc.desc      Verify scene 5 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0058 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 9');
      log.record('select#5 index=1');
      log.record('click#5');
      log.record('check#5 checked=false');
      log.record('close#5 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#5 scene 9');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 9|select#5 index=1|click#5|check#5 checked=false|close#5 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0058 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_5900
     * @tc.name      testSessionGrid0059
     * @tc.desc      Verify scene 5 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0059 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 10');
      log.record('check#5 checked=false');
      log.record('click#5');
      log.record('close#5 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#5 scene 10');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 10|check#5 checked=false|click#5|close#5 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0059 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6000
     * @tc.name      testSessionGrid0060
     * @tc.desc      Verify scene 5 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0060 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#5 scene 11');
      log.record('select#5 index=1');
      log.record('error#5 code2');
      log.record('click#5');
      log.record('close#5 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#5 scene 11');
      expect(log.hasPrefix('open#5')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#5 scene 11|select#5 index=1|error#5 code2|click#5|close#5 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0060 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6100
     * @tc.name      testSessionGrid0061
     * @tc.desc      Verify scene 6 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0061 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 0');
      log.record('select#6 index=1');
      log.record('click#6');
      log.record('close#6 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 0');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 0|select#6 index=1|click#6|close#6 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0061 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6200
     * @tc.name      testSessionGrid0062
     * @tc.desc      Verify scene 6 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0062 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 1');
      log.record('check#6 checked=false');
      log.record('error#6 code2');
      log.record('close#6 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 1');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 1|check#6 checked=false|error#6 code2|close#6 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0062 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6300
     * @tc.name      testSessionGrid0063
     * @tc.desc      Verify scene 6 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0063 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 2');
      log.record('select#6 index=1');
      log.record('select#6 index=2');
      log.record('click#6');
      log.record('close#6 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#6 scene 2');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 2|select#6 index=1|select#6 index=2|click#6|close#6 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0063 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6400
     * @tc.name      testSessionGrid0064
     * @tc.desc      Verify scene 6 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0064 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 3');
      log.record('error#6 code1');
      log.record('click#6');
      log.record('close#6 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 3');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 3|error#6 code1|click#6|close#6 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0064 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6500
     * @tc.name      testSessionGrid0065
     * @tc.desc      Verify scene 6 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0065 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 4');
      log.record('click#6');
      log.record('close#6 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#6 scene 4');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 4|click#6|close#6 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0065 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6600
     * @tc.name      testSessionGrid0066
     * @tc.desc      Verify scene 6 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0066 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 5');
      log.record('check#6 checked=false');
      log.record('check#6 checked=true');
      log.record('close#6 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 5');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 5|check#6 checked=false|check#6 checked=true|close#6 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0066 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6700
     * @tc.name      testSessionGrid0067
     * @tc.desc      Verify scene 6 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0067 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 6');
      log.record('select#6 index=1');
      log.record('check#6 checked=true');
      log.record('error#6 code3');
      log.record('close#6 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#6 scene 6');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 6|select#6 index=1|check#6 checked=true|error#6 code3|close#6 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0067 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6800
     * @tc.name      testSessionGrid0068
     * @tc.desc      Verify scene 6 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0068 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 7');
      log.record('click#6');
      log.record('select#6 index=2');
      log.record('close#6 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 7');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 7|click#6|select#6 index=2|close#6 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0068 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_6900
     * @tc.name      testSessionGrid0069
     * @tc.desc      Verify scene 6 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0069 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 8');
      log.record('error#6 code1');
      log.record('error#6 code2');
      log.record('close#6 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 8');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 8|error#6 code1|error#6 code2|close#6 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0069 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7000
     * @tc.name      testSessionGrid0070
     * @tc.desc      Verify scene 6 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0070 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 9');
      log.record('select#6 index=1');
      log.record('click#6');
      log.record('check#6 checked=false');
      log.record('close#6 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#6 scene 9');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 9|select#6 index=1|click#6|check#6 checked=false|close#6 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0070 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7100
     * @tc.name      testSessionGrid0071
     * @tc.desc      Verify scene 6 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0071 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 10');
      log.record('check#6 checked=false');
      log.record('click#6');
      log.record('close#6 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#6 scene 10');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 10|check#6 checked=false|click#6|close#6 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0071 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7200
     * @tc.name      testSessionGrid0072
     * @tc.desc      Verify scene 6 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0072 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#6 scene 11');
      log.record('select#6 index=1');
      log.record('error#6 code2');
      log.record('click#6');
      log.record('close#6 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#6 scene 11');
      expect(log.hasPrefix('open#6')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#6 scene 11|select#6 index=1|error#6 code2|click#6|close#6 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0072 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7300
     * @tc.name      testSessionGrid0073
     * @tc.desc      Verify scene 7 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0073 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 0');
      log.record('select#7 index=1');
      log.record('click#7');
      log.record('close#7 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 0');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 0|select#7 index=1|click#7|close#7 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0073 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7400
     * @tc.name      testSessionGrid0074
     * @tc.desc      Verify scene 7 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0074 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 1');
      log.record('check#7 checked=false');
      log.record('error#7 code2');
      log.record('close#7 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 1');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 1|check#7 checked=false|error#7 code2|close#7 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0074 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7500
     * @tc.name      testSessionGrid0075
     * @tc.desc      Verify scene 7 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0075 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 2');
      log.record('select#7 index=1');
      log.record('select#7 index=2');
      log.record('click#7');
      log.record('close#7 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#7 scene 2');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 2|select#7 index=1|select#7 index=2|click#7|close#7 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0075 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7600
     * @tc.name      testSessionGrid0076
     * @tc.desc      Verify scene 7 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0076 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 3');
      log.record('error#7 code1');
      log.record('click#7');
      log.record('close#7 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 3');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 3|error#7 code1|click#7|close#7 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0076 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7700
     * @tc.name      testSessionGrid0077
     * @tc.desc      Verify scene 7 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0077 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 4');
      log.record('click#7');
      log.record('close#7 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#7 scene 4');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 4|click#7|close#7 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0077 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7800
     * @tc.name      testSessionGrid0078
     * @tc.desc      Verify scene 7 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0078 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 5');
      log.record('check#7 checked=false');
      log.record('check#7 checked=true');
      log.record('close#7 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 5');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 5|check#7 checked=false|check#7 checked=true|close#7 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0078 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_7900
     * @tc.name      testSessionGrid0079
     * @tc.desc      Verify scene 7 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0079 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 6');
      log.record('select#7 index=1');
      log.record('check#7 checked=true');
      log.record('error#7 code3');
      log.record('close#7 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#7 scene 6');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 6|select#7 index=1|check#7 checked=true|error#7 code3|close#7 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0079 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP2_8000
     * @tc.name      testSessionGrid0080
     * @tc.desc      Verify scene 7 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0080 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 7');
      log.record('click#7');
      log.record('select#7 index=2');
      log.record('close#7 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 7');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 7|click#7|select#7 index=2|close#7 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0080 end');
    })

  })
}
