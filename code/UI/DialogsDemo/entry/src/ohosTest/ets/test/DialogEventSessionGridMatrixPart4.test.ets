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

export default function DialogEventSessionGridMatrixPart4Test(): void {
  describe('DialogEventSessionGridMatrixPart4', () => {

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12100
     * @tc.name      testSessionGrid0121
     * @tc.desc      Verify scene 11 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0121 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 0');
      log.record('select#11 index=1');
      log.record('click#11');
      log.record('close#11 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 0');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 0|select#11 index=1|click#11|close#11 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0121 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12200
     * @tc.name      testSessionGrid0122
     * @tc.desc      Verify scene 11 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0122 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 1');
      log.record('check#11 checked=false');
      log.record('error#11 code2');
      log.record('close#11 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 1');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 1|check#11 checked=false|error#11 code2|close#11 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0122 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12300
     * @tc.name      testSessionGrid0123
     * @tc.desc      Verify scene 11 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0123 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 2');
      log.record('select#11 index=1');
      log.record('select#11 index=2');
      log.record('click#11');
      log.record('close#11 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#11 scene 2');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 2|select#11 index=1|select#11 index=2|click#11|close#11 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0123 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12400
     * @tc.name      testSessionGrid0124
     * @tc.desc      Verify scene 11 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0124 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 3');
      log.record('error#11 code1');
      log.record('click#11');
      log.record('close#11 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 3');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 3|error#11 code1|click#11|close#11 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0124 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12500
     * @tc.name      testSessionGrid0125
     * @tc.desc      Verify scene 11 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0125 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 4');
      log.record('click#11');
      log.record('close#11 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#11 scene 4');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 4|click#11|close#11 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0125 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12600
     * @tc.name      testSessionGrid0126
     * @tc.desc      Verify scene 11 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0126 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 5');
      log.record('check#11 checked=false');
      log.record('check#11 checked=true');
      log.record('close#11 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 5');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 5|check#11 checked=false|check#11 checked=true|close#11 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0126 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12700
     * @tc.name      testSessionGrid0127
     * @tc.desc      Verify scene 11 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0127 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 6');
      log.record('select#11 index=1');
      log.record('check#11 checked=true');
      log.record('error#11 code3');
      log.record('close#11 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#11 scene 6');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 6|select#11 index=1|check#11 checked=true|error#11 code3|close#11 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0127 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12800
     * @tc.name      testSessionGrid0128
     * @tc.desc      Verify scene 11 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0128 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 7');
      log.record('click#11');
      log.record('select#11 index=2');
      log.record('close#11 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 7');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 7|click#11|select#11 index=2|close#11 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0128 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_12900
     * @tc.name      testSessionGrid0129
     * @tc.desc      Verify scene 11 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0129 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 8');
      log.record('error#11 code1');
      log.record('error#11 code2');
      log.record('close#11 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 8');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 8|error#11 code1|error#11 code2|close#11 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0129 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13000
     * @tc.name      testSessionGrid0130
     * @tc.desc      Verify scene 11 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0130 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 9');
      log.record('select#11 index=1');
      log.record('click#11');
      log.record('check#11 checked=false');
      log.record('close#11 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#11 scene 9');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 9|select#11 index=1|click#11|check#11 checked=false|close#11 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0130 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13100
     * @tc.name      testSessionGrid0131
     * @tc.desc      Verify scene 11 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0131 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 10');
      log.record('check#11 checked=false');
      log.record('click#11');
      log.record('close#11 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#11 scene 10');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 10|check#11 checked=false|click#11|close#11 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0131 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13200
     * @tc.name      testSessionGrid0132
     * @tc.desc      Verify scene 11 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0132 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#11 scene 11');
      log.record('select#11 index=1');
      log.record('error#11 code2');
      log.record('click#11');
      log.record('close#11 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#11 scene 11');
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#11 scene 11|select#11 index=1|error#11 code2|click#11|close#11 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0132 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13300
     * @tc.name      testSessionGrid0133
     * @tc.desc      Verify scene 12 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0133 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 0');
      log.record('select#12 index=1');
      log.record('click#12');
      log.record('close#12 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 0');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 0|select#12 index=1|click#12|close#12 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0133 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13400
     * @tc.name      testSessionGrid0134
     * @tc.desc      Verify scene 12 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0134 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 1');
      log.record('check#12 checked=false');
      log.record('error#12 code2');
      log.record('close#12 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 1');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 1|check#12 checked=false|error#12 code2|close#12 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0134 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13500
     * @tc.name      testSessionGrid0135
     * @tc.desc      Verify scene 12 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0135 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 2');
      log.record('select#12 index=1');
      log.record('select#12 index=2');
      log.record('click#12');
      log.record('close#12 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#12 scene 2');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 2|select#12 index=1|select#12 index=2|click#12|close#12 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0135 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13600
     * @tc.name      testSessionGrid0136
     * @tc.desc      Verify scene 12 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0136 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 3');
      log.record('error#12 code1');
      log.record('click#12');
      log.record('close#12 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 3');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 3|error#12 code1|click#12|close#12 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0136 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13700
     * @tc.name      testSessionGrid0137
     * @tc.desc      Verify scene 12 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0137 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 4');
      log.record('click#12');
      log.record('close#12 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#12 scene 4');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 4|click#12|close#12 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0137 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13800
     * @tc.name      testSessionGrid0138
     * @tc.desc      Verify scene 12 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0138 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 5');
      log.record('check#12 checked=false');
      log.record('check#12 checked=true');
      log.record('close#12 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 5');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 5|check#12 checked=false|check#12 checked=true|close#12 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0138 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_13900
     * @tc.name      testSessionGrid0139
     * @tc.desc      Verify scene 12 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0139 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 6');
      log.record('select#12 index=1');
      log.record('check#12 checked=true');
      log.record('error#12 code3');
      log.record('close#12 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#12 scene 6');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 6|select#12 index=1|check#12 checked=true|error#12 code3|close#12 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0139 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14000
     * @tc.name      testSessionGrid0140
     * @tc.desc      Verify scene 12 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0140 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 7');
      log.record('click#12');
      log.record('select#12 index=2');
      log.record('close#12 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 7');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 7|click#12|select#12 index=2|close#12 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0140 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14100
     * @tc.name      testSessionGrid0141
     * @tc.desc      Verify scene 12 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0141 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 8');
      log.record('error#12 code1');
      log.record('error#12 code2');
      log.record('close#12 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 8');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 8|error#12 code1|error#12 code2|close#12 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0141 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14200
     * @tc.name      testSessionGrid0142
     * @tc.desc      Verify scene 12 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0142 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 9');
      log.record('select#12 index=1');
      log.record('click#12');
      log.record('check#12 checked=false');
      log.record('close#12 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#12 scene 9');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 9|select#12 index=1|click#12|check#12 checked=false|close#12 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0142 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14300
     * @tc.name      testSessionGrid0143
     * @tc.desc      Verify scene 12 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0143 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 10');
      log.record('check#12 checked=false');
      log.record('click#12');
      log.record('close#12 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#12 scene 10');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 10|check#12 checked=false|click#12|close#12 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0143 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14400
     * @tc.name      testSessionGrid0144
     * @tc.desc      Verify scene 12 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0144 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#12 scene 11');
      log.record('select#12 index=1');
      log.record('error#12 code2');
      log.record('click#12');
      log.record('close#12 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#12 scene 11');
      expect(log.hasPrefix('open#12')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#12 scene 11|select#12 index=1|error#12 code2|click#12|close#12 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0144 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14500
     * @tc.name      testSessionGrid0145
     * @tc.desc      Verify scene 13 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0145 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 0');
      log.record('select#13 index=1');
      log.record('click#13');
      log.record('close#13 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 0');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 0|select#13 index=1|click#13|close#13 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0145 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14600
     * @tc.name      testSessionGrid0146
     * @tc.desc      Verify scene 13 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0146 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 1');
      log.record('check#13 checked=false');
      log.record('error#13 code2');
      log.record('close#13 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 1');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 1|check#13 checked=false|error#13 code2|close#13 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0146 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14700
     * @tc.name      testSessionGrid0147
     * @tc.desc      Verify scene 13 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0147 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 2');
      log.record('select#13 index=1');
      log.record('select#13 index=2');
      log.record('click#13');
      log.record('close#13 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#13 scene 2');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 2|select#13 index=1|select#13 index=2|click#13|close#13 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0147 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14800
     * @tc.name      testSessionGrid0148
     * @tc.desc      Verify scene 13 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0148 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 3');
      log.record('error#13 code1');
      log.record('click#13');
      log.record('close#13 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 3');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 3|error#13 code1|click#13|close#13 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0148 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_14900
     * @tc.name      testSessionGrid0149
     * @tc.desc      Verify scene 13 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0149 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 4');
      log.record('click#13');
      log.record('close#13 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#13 scene 4');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 4|click#13|close#13 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0149 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15000
     * @tc.name      testSessionGrid0150
     * @tc.desc      Verify scene 13 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0150 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 5');
      log.record('check#13 checked=false');
      log.record('check#13 checked=true');
      log.record('close#13 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 5');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 5|check#13 checked=false|check#13 checked=true|close#13 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0150 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15100
     * @tc.name      testSessionGrid0151
     * @tc.desc      Verify scene 13 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0151 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 6');
      log.record('select#13 index=1');
      log.record('check#13 checked=true');
      log.record('error#13 code3');
      log.record('close#13 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#13 scene 6');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 6|select#13 index=1|check#13 checked=true|error#13 code3|close#13 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0151 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15200
     * @tc.name      testSessionGrid0152
     * @tc.desc      Verify scene 13 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0152 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 7');
      log.record('click#13');
      log.record('select#13 index=2');
      log.record('close#13 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 7');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 7|click#13|select#13 index=2|close#13 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0152 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15300
     * @tc.name      testSessionGrid0153
     * @tc.desc      Verify scene 13 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0153 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 8');
      log.record('error#13 code1');
      log.record('error#13 code2');
      log.record('close#13 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 8');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 8|error#13 code1|error#13 code2|close#13 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0153 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15400
     * @tc.name      testSessionGrid0154
     * @tc.desc      Verify scene 13 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0154 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 9');
      log.record('select#13 index=1');
      log.record('click#13');
      log.record('check#13 checked=false');
      log.record('close#13 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#13 scene 9');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 9|select#13 index=1|click#13|check#13 checked=false|close#13 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0154 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15500
     * @tc.name      testSessionGrid0155
     * @tc.desc      Verify scene 13 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0155 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 10');
      log.record('check#13 checked=false');
      log.record('click#13');
      log.record('close#13 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#13 scene 10');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 10|check#13 checked=false|click#13|close#13 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0155 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15600
     * @tc.name      testSessionGrid0156
     * @tc.desc      Verify scene 13 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0156 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#13 scene 11');
      log.record('select#13 index=1');
      log.record('error#13 code2');
      log.record('click#13');
      log.record('close#13 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#13 scene 11');
      expect(log.hasPrefix('open#13')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#13 scene 11|select#13 index=1|error#13 code2|click#13|close#13 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0156 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15700
     * @tc.name      testSessionGrid0157
     * @tc.desc      Verify scene 14 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0157 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 0');
      log.record('select#14 index=1');
      log.record('click#14');
      log.record('close#14 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 0');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 0|select#14 index=1|click#14|close#14 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0157 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15800
     * @tc.name      testSessionGrid0158
     * @tc.desc      Verify scene 14 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0158 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 1');
      log.record('check#14 checked=false');
      log.record('error#14 code2');
      log.record('close#14 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 1');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 1|check#14 checked=false|error#14 code2|close#14 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0158 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_15900
     * @tc.name      testSessionGrid0159
     * @tc.desc      Verify scene 14 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0159 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 2');
      log.record('select#14 index=1');
      log.record('select#14 index=2');
      log.record('click#14');
      log.record('close#14 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#14 scene 2');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 2|select#14 index=1|select#14 index=2|click#14|close#14 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0159 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP4_16000
     * @tc.name      testSessionGrid0160
     * @tc.desc      Verify scene 14 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0160 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 3');
      log.record('error#14 code1');
      log.record('click#14');
      log.record('close#14 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 3');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 3|error#14 code1|click#14|close#14 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0160 end');
    })

  })
}
