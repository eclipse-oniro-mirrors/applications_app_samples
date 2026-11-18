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

export default function DialogEventSessionGridMatrixPart5Test(): void {
  describe('DialogEventSessionGridMatrixPart5', () => {

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16100
     * @tc.name      testSessionGrid0161
     * @tc.desc      Verify scene 14 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0161 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 4');
      log.record('click#14');
      log.record('close#14 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#14 scene 4');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 4|click#14|close#14 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0161 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16200
     * @tc.name      testSessionGrid0162
     * @tc.desc      Verify scene 14 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0162 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 5');
      log.record('check#14 checked=false');
      log.record('check#14 checked=true');
      log.record('close#14 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 5');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 5|check#14 checked=false|check#14 checked=true|close#14 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0162 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16300
     * @tc.name      testSessionGrid0163
     * @tc.desc      Verify scene 14 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0163 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 6');
      log.record('select#14 index=1');
      log.record('check#14 checked=true');
      log.record('error#14 code3');
      log.record('close#14 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#14 scene 6');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 6|select#14 index=1|check#14 checked=true|error#14 code3|close#14 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0163 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16400
     * @tc.name      testSessionGrid0164
     * @tc.desc      Verify scene 14 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0164 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 7');
      log.record('click#14');
      log.record('select#14 index=2');
      log.record('close#14 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 7');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 7|click#14|select#14 index=2|close#14 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0164 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16500
     * @tc.name      testSessionGrid0165
     * @tc.desc      Verify scene 14 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0165 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 8');
      log.record('error#14 code1');
      log.record('error#14 code2');
      log.record('close#14 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 8');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 8|error#14 code1|error#14 code2|close#14 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0165 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16600
     * @tc.name      testSessionGrid0166
     * @tc.desc      Verify scene 14 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0166 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 9');
      log.record('select#14 index=1');
      log.record('click#14');
      log.record('check#14 checked=false');
      log.record('close#14 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#14 scene 9');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 9|select#14 index=1|click#14|check#14 checked=false|close#14 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0166 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16700
     * @tc.name      testSessionGrid0167
     * @tc.desc      Verify scene 14 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0167 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 10');
      log.record('check#14 checked=false');
      log.record('click#14');
      log.record('close#14 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#14 scene 10');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 10|check#14 checked=false|click#14|close#14 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0167 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16800
     * @tc.name      testSessionGrid0168
     * @tc.desc      Verify scene 14 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0168 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#14 scene 11');
      log.record('select#14 index=1');
      log.record('error#14 code2');
      log.record('click#14');
      log.record('close#14 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#14 scene 11');
      expect(log.hasPrefix('open#14')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#14 scene 11|select#14 index=1|error#14 code2|click#14|close#14 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0168 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_16900
     * @tc.name      testSessionGrid0169
     * @tc.desc      Verify scene 15 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0169 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 0');
      log.record('select#15 index=1');
      log.record('click#15');
      log.record('close#15 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 0');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 0|select#15 index=1|click#15|close#15 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0169 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17000
     * @tc.name      testSessionGrid0170
     * @tc.desc      Verify scene 15 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0170 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 1');
      log.record('check#15 checked=false');
      log.record('error#15 code2');
      log.record('close#15 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 1');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 1|check#15 checked=false|error#15 code2|close#15 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0170 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17100
     * @tc.name      testSessionGrid0171
     * @tc.desc      Verify scene 15 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0171 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 2');
      log.record('select#15 index=1');
      log.record('select#15 index=2');
      log.record('click#15');
      log.record('close#15 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#15 scene 2');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 2|select#15 index=1|select#15 index=2|click#15|close#15 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0171 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17200
     * @tc.name      testSessionGrid0172
     * @tc.desc      Verify scene 15 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0172 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 3');
      log.record('error#15 code1');
      log.record('click#15');
      log.record('close#15 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 3');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 3|error#15 code1|click#15|close#15 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0172 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17300
     * @tc.name      testSessionGrid0173
     * @tc.desc      Verify scene 15 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0173 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 4');
      log.record('click#15');
      log.record('close#15 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#15 scene 4');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 4|click#15|close#15 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0173 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17400
     * @tc.name      testSessionGrid0174
     * @tc.desc      Verify scene 15 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0174 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 5');
      log.record('check#15 checked=false');
      log.record('check#15 checked=true');
      log.record('close#15 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 5');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 5|check#15 checked=false|check#15 checked=true|close#15 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0174 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17500
     * @tc.name      testSessionGrid0175
     * @tc.desc      Verify scene 15 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0175 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 6');
      log.record('select#15 index=1');
      log.record('check#15 checked=true');
      log.record('error#15 code3');
      log.record('close#15 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#15 scene 6');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 6|select#15 index=1|check#15 checked=true|error#15 code3|close#15 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0175 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17600
     * @tc.name      testSessionGrid0176
     * @tc.desc      Verify scene 15 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0176 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 7');
      log.record('click#15');
      log.record('select#15 index=2');
      log.record('close#15 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 7');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 7|click#15|select#15 index=2|close#15 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0176 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17700
     * @tc.name      testSessionGrid0177
     * @tc.desc      Verify scene 15 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0177 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 8');
      log.record('error#15 code1');
      log.record('error#15 code2');
      log.record('close#15 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 8');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 8|error#15 code1|error#15 code2|close#15 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0177 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17800
     * @tc.name      testSessionGrid0178
     * @tc.desc      Verify scene 15 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0178 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 9');
      log.record('select#15 index=1');
      log.record('click#15');
      log.record('check#15 checked=false');
      log.record('close#15 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#15 scene 9');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 9|select#15 index=1|click#15|check#15 checked=false|close#15 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0178 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_17900
     * @tc.name      testSessionGrid0179
     * @tc.desc      Verify scene 15 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0179 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 10');
      log.record('check#15 checked=false');
      log.record('click#15');
      log.record('close#15 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#15 scene 10');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 10|check#15 checked=false|click#15|close#15 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0179 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18000
     * @tc.name      testSessionGrid0180
     * @tc.desc      Verify scene 15 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0180 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#15 scene 11');
      log.record('select#15 index=1');
      log.record('error#15 code2');
      log.record('click#15');
      log.record('close#15 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#15 scene 11');
      expect(log.hasPrefix('open#15')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#15 scene 11|select#15 index=1|error#15 code2|click#15|close#15 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0180 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18100
     * @tc.name      testSessionGrid0181
     * @tc.desc      Verify scene 16 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0181 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 0');
      log.record('select#16 index=1');
      log.record('click#16');
      log.record('close#16 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 0');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 0|select#16 index=1|click#16|close#16 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0181 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18200
     * @tc.name      testSessionGrid0182
     * @tc.desc      Verify scene 16 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0182 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 1');
      log.record('check#16 checked=false');
      log.record('error#16 code2');
      log.record('close#16 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 1');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 1|check#16 checked=false|error#16 code2|close#16 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0182 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18300
     * @tc.name      testSessionGrid0183
     * @tc.desc      Verify scene 16 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0183 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 2');
      log.record('select#16 index=1');
      log.record('select#16 index=2');
      log.record('click#16');
      log.record('close#16 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#16 scene 2');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 2|select#16 index=1|select#16 index=2|click#16|close#16 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0183 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18400
     * @tc.name      testSessionGrid0184
     * @tc.desc      Verify scene 16 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0184 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 3');
      log.record('error#16 code1');
      log.record('click#16');
      log.record('close#16 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 3');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 3|error#16 code1|click#16|close#16 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0184 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18500
     * @tc.name      testSessionGrid0185
     * @tc.desc      Verify scene 16 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0185 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 4');
      log.record('click#16');
      log.record('close#16 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#16 scene 4');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 4|click#16|close#16 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0185 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18600
     * @tc.name      testSessionGrid0186
     * @tc.desc      Verify scene 16 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0186 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 5');
      log.record('check#16 checked=false');
      log.record('check#16 checked=true');
      log.record('close#16 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 5');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 5|check#16 checked=false|check#16 checked=true|close#16 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0186 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18700
     * @tc.name      testSessionGrid0187
     * @tc.desc      Verify scene 16 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0187 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 6');
      log.record('select#16 index=1');
      log.record('check#16 checked=true');
      log.record('error#16 code3');
      log.record('close#16 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#16 scene 6');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 6|select#16 index=1|check#16 checked=true|error#16 code3|close#16 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0187 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18800
     * @tc.name      testSessionGrid0188
     * @tc.desc      Verify scene 16 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0188 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 7');
      log.record('click#16');
      log.record('select#16 index=2');
      log.record('close#16 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 7');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 7|click#16|select#16 index=2|close#16 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0188 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_18900
     * @tc.name      testSessionGrid0189
     * @tc.desc      Verify scene 16 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0189 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 8');
      log.record('error#16 code1');
      log.record('error#16 code2');
      log.record('close#16 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 8');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 8|error#16 code1|error#16 code2|close#16 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0189 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19000
     * @tc.name      testSessionGrid0190
     * @tc.desc      Verify scene 16 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0190 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 9');
      log.record('select#16 index=1');
      log.record('click#16');
      log.record('check#16 checked=false');
      log.record('close#16 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#16 scene 9');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 9|select#16 index=1|click#16|check#16 checked=false|close#16 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0190 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19100
     * @tc.name      testSessionGrid0191
     * @tc.desc      Verify scene 16 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0191 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 10');
      log.record('check#16 checked=false');
      log.record('click#16');
      log.record('close#16 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#16 scene 10');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 10|check#16 checked=false|click#16|close#16 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0191 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19200
     * @tc.name      testSessionGrid0192
     * @tc.desc      Verify scene 16 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0192 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#16 scene 11');
      log.record('select#16 index=1');
      log.record('error#16 code2');
      log.record('click#16');
      log.record('close#16 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#16 scene 11');
      expect(log.hasPrefix('open#16')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#16 scene 11|select#16 index=1|error#16 code2|click#16|close#16 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0192 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19300
     * @tc.name      testSessionGrid0193
     * @tc.desc      Verify scene 17 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0193 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 0');
      log.record('select#17 index=1');
      log.record('click#17');
      log.record('close#17 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 0');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 0|select#17 index=1|click#17|close#17 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0193 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19400
     * @tc.name      testSessionGrid0194
     * @tc.desc      Verify scene 17 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0194 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 1');
      log.record('check#17 checked=false');
      log.record('error#17 code2');
      log.record('close#17 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 1');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 1|check#17 checked=false|error#17 code2|close#17 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0194 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19500
     * @tc.name      testSessionGrid0195
     * @tc.desc      Verify scene 17 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0195 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 2');
      log.record('select#17 index=1');
      log.record('select#17 index=2');
      log.record('click#17');
      log.record('close#17 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#17 scene 2');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 2|select#17 index=1|select#17 index=2|click#17|close#17 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0195 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19600
     * @tc.name      testSessionGrid0196
     * @tc.desc      Verify scene 17 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0196 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 3');
      log.record('error#17 code1');
      log.record('click#17');
      log.record('close#17 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 3');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 3|error#17 code1|click#17|close#17 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0196 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19700
     * @tc.name      testSessionGrid0197
     * @tc.desc      Verify scene 17 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0197 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 4');
      log.record('click#17');
      log.record('close#17 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#17 scene 4');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 4|click#17|close#17 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0197 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19800
     * @tc.name      testSessionGrid0198
     * @tc.desc      Verify scene 17 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0198 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 5');
      log.record('check#17 checked=false');
      log.record('check#17 checked=true');
      log.record('close#17 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 5');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 5|check#17 checked=false|check#17 checked=true|close#17 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0198 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_19900
     * @tc.name      testSessionGrid0199
     * @tc.desc      Verify scene 17 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0199 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 6');
      log.record('select#17 index=1');
      log.record('check#17 checked=true');
      log.record('error#17 code3');
      log.record('close#17 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#17 scene 6');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 6|select#17 index=1|check#17 checked=true|error#17 code3|close#17 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0199 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP5_20000
     * @tc.name      testSessionGrid0200
     * @tc.desc      Verify scene 17 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0200 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 7');
      log.record('click#17');
      log.record('select#17 index=2');
      log.record('close#17 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 7');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 7|click#17|select#17 index=2|close#17 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0200 end');
    })

  })
}
