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

export default function DialogEventSessionGridMatrixPart3Test(): void {
  describe('DialogEventSessionGridMatrixPart3', () => {

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8100
     * @tc.name      testSessionGrid0081
     * @tc.desc      Verify scene 7 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0081 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 8');
      log.record('error#7 code1');
      log.record('error#7 code2');
      log.record('close#7 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 8');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 8|error#7 code1|error#7 code2|close#7 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0081 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8200
     * @tc.name      testSessionGrid0082
     * @tc.desc      Verify scene 7 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0082 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 9');
      log.record('select#7 index=1');
      log.record('click#7');
      log.record('check#7 checked=false');
      log.record('close#7 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#7 scene 9');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 9|select#7 index=1|click#7|check#7 checked=false|close#7 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0082 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8300
     * @tc.name      testSessionGrid0083
     * @tc.desc      Verify scene 7 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0083 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 10');
      log.record('check#7 checked=false');
      log.record('click#7');
      log.record('close#7 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#7 scene 10');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 10|check#7 checked=false|click#7|close#7 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0083 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8400
     * @tc.name      testSessionGrid0084
     * @tc.desc      Verify scene 7 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0084 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#7 scene 11');
      log.record('select#7 index=1');
      log.record('error#7 code2');
      log.record('click#7');
      log.record('close#7 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#7 scene 11');
      expect(log.hasPrefix('open#7')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#7 scene 11|select#7 index=1|error#7 code2|click#7|close#7 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0084 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8500
     * @tc.name      testSessionGrid0085
     * @tc.desc      Verify scene 8 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0085 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 0');
      log.record('select#8 index=1');
      log.record('click#8');
      log.record('close#8 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 0');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 0|select#8 index=1|click#8|close#8 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0085 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8600
     * @tc.name      testSessionGrid0086
     * @tc.desc      Verify scene 8 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0086 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 1');
      log.record('check#8 checked=false');
      log.record('error#8 code2');
      log.record('close#8 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 1');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 1|check#8 checked=false|error#8 code2|close#8 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0086 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8700
     * @tc.name      testSessionGrid0087
     * @tc.desc      Verify scene 8 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0087 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 2');
      log.record('select#8 index=1');
      log.record('select#8 index=2');
      log.record('click#8');
      log.record('close#8 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#8 scene 2');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 2|select#8 index=1|select#8 index=2|click#8|close#8 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0087 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8800
     * @tc.name      testSessionGrid0088
     * @tc.desc      Verify scene 8 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0088 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 3');
      log.record('error#8 code1');
      log.record('click#8');
      log.record('close#8 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 3');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 3|error#8 code1|click#8|close#8 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0088 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_8900
     * @tc.name      testSessionGrid0089
     * @tc.desc      Verify scene 8 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0089 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 4');
      log.record('click#8');
      log.record('close#8 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#8 scene 4');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 4|click#8|close#8 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0089 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9000
     * @tc.name      testSessionGrid0090
     * @tc.desc      Verify scene 8 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0090 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 5');
      log.record('check#8 checked=false');
      log.record('check#8 checked=true');
      log.record('close#8 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 5');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 5|check#8 checked=false|check#8 checked=true|close#8 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0090 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9100
     * @tc.name      testSessionGrid0091
     * @tc.desc      Verify scene 8 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0091 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 6');
      log.record('select#8 index=1');
      log.record('check#8 checked=true');
      log.record('error#8 code3');
      log.record('close#8 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#8 scene 6');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 6|select#8 index=1|check#8 checked=true|error#8 code3|close#8 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0091 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9200
     * @tc.name      testSessionGrid0092
     * @tc.desc      Verify scene 8 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0092 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 7');
      log.record('click#8');
      log.record('select#8 index=2');
      log.record('close#8 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 7');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 7|click#8|select#8 index=2|close#8 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0092 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9300
     * @tc.name      testSessionGrid0093
     * @tc.desc      Verify scene 8 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0093 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 8');
      log.record('error#8 code1');
      log.record('error#8 code2');
      log.record('close#8 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 8');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 8|error#8 code1|error#8 code2|close#8 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0093 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9400
     * @tc.name      testSessionGrid0094
     * @tc.desc      Verify scene 8 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0094 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 9');
      log.record('select#8 index=1');
      log.record('click#8');
      log.record('check#8 checked=false');
      log.record('close#8 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#8 scene 9');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 9|select#8 index=1|click#8|check#8 checked=false|close#8 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0094 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9500
     * @tc.name      testSessionGrid0095
     * @tc.desc      Verify scene 8 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0095 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 10');
      log.record('check#8 checked=false');
      log.record('click#8');
      log.record('close#8 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#8 scene 10');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 10|check#8 checked=false|click#8|close#8 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0095 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9600
     * @tc.name      testSessionGrid0096
     * @tc.desc      Verify scene 8 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0096 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#8 scene 11');
      log.record('select#8 index=1');
      log.record('error#8 code2');
      log.record('click#8');
      log.record('close#8 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#8 scene 11');
      expect(log.hasPrefix('open#8')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#8 scene 11|select#8 index=1|error#8 code2|click#8|close#8 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0096 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9700
     * @tc.name      testSessionGrid0097
     * @tc.desc      Verify scene 9 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0097 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 0');
      log.record('select#9 index=1');
      log.record('click#9');
      log.record('close#9 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 0');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 0|select#9 index=1|click#9|close#9 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0097 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9800
     * @tc.name      testSessionGrid0098
     * @tc.desc      Verify scene 9 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0098 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 1');
      log.record('check#9 checked=false');
      log.record('error#9 code2');
      log.record('close#9 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 1');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 1|check#9 checked=false|error#9 code2|close#9 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0098 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_9900
     * @tc.name      testSessionGrid0099
     * @tc.desc      Verify scene 9 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0099 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 2');
      log.record('select#9 index=1');
      log.record('select#9 index=2');
      log.record('click#9');
      log.record('close#9 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#9 scene 2');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 2|select#9 index=1|select#9 index=2|click#9|close#9 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0099 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10000
     * @tc.name      testSessionGrid0100
     * @tc.desc      Verify scene 9 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0100 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 3');
      log.record('error#9 code1');
      log.record('click#9');
      log.record('close#9 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 3');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 3|error#9 code1|click#9|close#9 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0100 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10100
     * @tc.name      testSessionGrid0101
     * @tc.desc      Verify scene 9 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0101 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 4');
      log.record('click#9');
      log.record('close#9 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#9 scene 4');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 4|click#9|close#9 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0101 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10200
     * @tc.name      testSessionGrid0102
     * @tc.desc      Verify scene 9 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0102 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 5');
      log.record('check#9 checked=false');
      log.record('check#9 checked=true');
      log.record('close#9 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 5');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 5|check#9 checked=false|check#9 checked=true|close#9 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0102 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10300
     * @tc.name      testSessionGrid0103
     * @tc.desc      Verify scene 9 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0103 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 6');
      log.record('select#9 index=1');
      log.record('check#9 checked=true');
      log.record('error#9 code3');
      log.record('close#9 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#9 scene 6');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 6|select#9 index=1|check#9 checked=true|error#9 code3|close#9 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0103 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10400
     * @tc.name      testSessionGrid0104
     * @tc.desc      Verify scene 9 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0104 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 7');
      log.record('click#9');
      log.record('select#9 index=2');
      log.record('close#9 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 7');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 7|click#9|select#9 index=2|close#9 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0104 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10500
     * @tc.name      testSessionGrid0105
     * @tc.desc      Verify scene 9 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0105 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 8');
      log.record('error#9 code1');
      log.record('error#9 code2');
      log.record('close#9 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 8');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 8|error#9 code1|error#9 code2|close#9 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0105 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10600
     * @tc.name      testSessionGrid0106
     * @tc.desc      Verify scene 9 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0106 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 9');
      log.record('select#9 index=1');
      log.record('click#9');
      log.record('check#9 checked=false');
      log.record('close#9 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#9 scene 9');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 9|select#9 index=1|click#9|check#9 checked=false|close#9 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0106 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10700
     * @tc.name      testSessionGrid0107
     * @tc.desc      Verify scene 9 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0107 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 10');
      log.record('check#9 checked=false');
      log.record('click#9');
      log.record('close#9 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#9 scene 10');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 10|check#9 checked=false|click#9|close#9 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0107 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10800
     * @tc.name      testSessionGrid0108
     * @tc.desc      Verify scene 9 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0108 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#9 scene 11');
      log.record('select#9 index=1');
      log.record('error#9 code2');
      log.record('click#9');
      log.record('close#9 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#9 scene 11');
      expect(log.hasPrefix('open#9')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#9 scene 11|select#9 index=1|error#9 code2|click#9|close#9 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0108 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_10900
     * @tc.name      testSessionGrid0109
     * @tc.desc      Verify scene 10 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0109 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 0');
      log.record('select#10 index=1');
      log.record('click#10');
      log.record('close#10 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 0');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 0|select#10 index=1|click#10|close#10 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0109 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11000
     * @tc.name      testSessionGrid0110
     * @tc.desc      Verify scene 10 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0110 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 1');
      log.record('check#10 checked=false');
      log.record('error#10 code2');
      log.record('close#10 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 1');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 1|check#10 checked=false|error#10 code2|close#10 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0110 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11100
     * @tc.name      testSessionGrid0111
     * @tc.desc      Verify scene 10 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0111 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 2');
      log.record('select#10 index=1');
      log.record('select#10 index=2');
      log.record('click#10');
      log.record('close#10 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#10 scene 2');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 2|select#10 index=1|select#10 index=2|click#10|close#10 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0111 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11200
     * @tc.name      testSessionGrid0112
     * @tc.desc      Verify scene 10 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0112 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 3');
      log.record('error#10 code1');
      log.record('click#10');
      log.record('close#10 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 3');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 3|error#10 code1|click#10|close#10 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0112 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11300
     * @tc.name      testSessionGrid0113
     * @tc.desc      Verify scene 10 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0113 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 4');
      log.record('click#10');
      log.record('close#10 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#10 scene 4');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 4|click#10|close#10 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0113 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11400
     * @tc.name      testSessionGrid0114
     * @tc.desc      Verify scene 10 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0114 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 5');
      log.record('check#10 checked=false');
      log.record('check#10 checked=true');
      log.record('close#10 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 5');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 5|check#10 checked=false|check#10 checked=true|close#10 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0114 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11500
     * @tc.name      testSessionGrid0115
     * @tc.desc      Verify scene 10 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0115 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 6');
      log.record('select#10 index=1');
      log.record('check#10 checked=true');
      log.record('error#10 code3');
      log.record('close#10 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#10 scene 6');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 6|select#10 index=1|check#10 checked=true|error#10 code3|close#10 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0115 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11600
     * @tc.name      testSessionGrid0116
     * @tc.desc      Verify scene 10 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0116 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 7');
      log.record('click#10');
      log.record('select#10 index=2');
      log.record('close#10 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 7');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 7|click#10|select#10 index=2|close#10 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0116 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11700
     * @tc.name      testSessionGrid0117
     * @tc.desc      Verify scene 10 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0117 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 8');
      log.record('error#10 code1');
      log.record('error#10 code2');
      log.record('close#10 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 8');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 8|error#10 code1|error#10 code2|close#10 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0117 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11800
     * @tc.name      testSessionGrid0118
     * @tc.desc      Verify scene 10 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0118 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 9');
      log.record('select#10 index=1');
      log.record('click#10');
      log.record('check#10 checked=false');
      log.record('close#10 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#10 scene 9');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 9|select#10 index=1|click#10|check#10 checked=false|close#10 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0118 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_11900
     * @tc.name      testSessionGrid0119
     * @tc.desc      Verify scene 10 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0119 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 10');
      log.record('check#10 checked=false');
      log.record('click#10');
      log.record('close#10 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#10 scene 10');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 10|check#10 checked=false|click#10|close#10 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0119 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP3_12000
     * @tc.name      testSessionGrid0120
     * @tc.desc      Verify scene 10 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0120 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#10 scene 11');
      log.record('select#10 index=1');
      log.record('error#10 code2');
      log.record('click#10');
      log.record('close#10 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#10 scene 11');
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#10 scene 11|select#10 index=1|error#10 code2|click#10|close#10 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0120 end');
    })

  })
}
