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

export default function DialogEventSessionGridMatrixPart6Test(): void {
  describe('DialogEventSessionGridMatrixPart6', () => {

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20100
     * @tc.name      testSessionGrid0201
     * @tc.desc      Verify scene 17 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0201 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 8');
      log.record('error#17 code1');
      log.record('error#17 code2');
      log.record('close#17 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 8');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 8|error#17 code1|error#17 code2|close#17 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0201 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20200
     * @tc.name      testSessionGrid0202
     * @tc.desc      Verify scene 17 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0202 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 9');
      log.record('select#17 index=1');
      log.record('click#17');
      log.record('check#17 checked=false');
      log.record('close#17 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#17 scene 9');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 9|select#17 index=1|click#17|check#17 checked=false|close#17 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0202 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20300
     * @tc.name      testSessionGrid0203
     * @tc.desc      Verify scene 17 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0203 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 10');
      log.record('check#17 checked=false');
      log.record('click#17');
      log.record('close#17 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#17 scene 10');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 10|check#17 checked=false|click#17|close#17 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0203 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20400
     * @tc.name      testSessionGrid0204
     * @tc.desc      Verify scene 17 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0204 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#17 scene 11');
      log.record('select#17 index=1');
      log.record('error#17 code2');
      log.record('click#17');
      log.record('close#17 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#17 scene 11');
      expect(log.hasPrefix('open#17')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#17 scene 11|select#17 index=1|error#17 code2|click#17|close#17 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0204 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20500
     * @tc.name      testSessionGrid0205
     * @tc.desc      Verify scene 18 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0205 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 0');
      log.record('select#18 index=1');
      log.record('click#18');
      log.record('close#18 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 0');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 0|select#18 index=1|click#18|close#18 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0205 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20600
     * @tc.name      testSessionGrid0206
     * @tc.desc      Verify scene 18 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0206 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 1');
      log.record('check#18 checked=false');
      log.record('error#18 code2');
      log.record('close#18 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 1');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 1|check#18 checked=false|error#18 code2|close#18 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0206 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20700
     * @tc.name      testSessionGrid0207
     * @tc.desc      Verify scene 18 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0207 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 2');
      log.record('select#18 index=1');
      log.record('select#18 index=2');
      log.record('click#18');
      log.record('close#18 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#18 scene 2');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 2|select#18 index=1|select#18 index=2|click#18|close#18 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0207 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20800
     * @tc.name      testSessionGrid0208
     * @tc.desc      Verify scene 18 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0208 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 3');
      log.record('error#18 code1');
      log.record('click#18');
      log.record('close#18 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 3');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 3|error#18 code1|click#18|close#18 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0208 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_20900
     * @tc.name      testSessionGrid0209
     * @tc.desc      Verify scene 18 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0209 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 4');
      log.record('click#18');
      log.record('close#18 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#18 scene 4');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 4|click#18|close#18 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0209 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21000
     * @tc.name      testSessionGrid0210
     * @tc.desc      Verify scene 18 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0210 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 5');
      log.record('check#18 checked=false');
      log.record('check#18 checked=true');
      log.record('close#18 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 5');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 5|check#18 checked=false|check#18 checked=true|close#18 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0210 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21100
     * @tc.name      testSessionGrid0211
     * @tc.desc      Verify scene 18 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0211 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 6');
      log.record('select#18 index=1');
      log.record('check#18 checked=true');
      log.record('error#18 code3');
      log.record('close#18 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#18 scene 6');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 6|select#18 index=1|check#18 checked=true|error#18 code3|close#18 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0211 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21200
     * @tc.name      testSessionGrid0212
     * @tc.desc      Verify scene 18 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0212 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 7');
      log.record('click#18');
      log.record('select#18 index=2');
      log.record('close#18 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 7');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 7|click#18|select#18 index=2|close#18 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0212 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21300
     * @tc.name      testSessionGrid0213
     * @tc.desc      Verify scene 18 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0213 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 8');
      log.record('error#18 code1');
      log.record('error#18 code2');
      log.record('close#18 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 8');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 8|error#18 code1|error#18 code2|close#18 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0213 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21400
     * @tc.name      testSessionGrid0214
     * @tc.desc      Verify scene 18 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0214 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 9');
      log.record('select#18 index=1');
      log.record('click#18');
      log.record('check#18 checked=false');
      log.record('close#18 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#18 scene 9');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 9|select#18 index=1|click#18|check#18 checked=false|close#18 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0214 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21500
     * @tc.name      testSessionGrid0215
     * @tc.desc      Verify scene 18 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0215 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 10');
      log.record('check#18 checked=false');
      log.record('click#18');
      log.record('close#18 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#18 scene 10');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 10|check#18 checked=false|click#18|close#18 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0215 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21600
     * @tc.name      testSessionGrid0216
     * @tc.desc      Verify scene 18 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0216 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#18 scene 11');
      log.record('select#18 index=1');
      log.record('error#18 code2');
      log.record('click#18');
      log.record('close#18 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#18 scene 11');
      expect(log.hasPrefix('open#18')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#18 scene 11|select#18 index=1|error#18 code2|click#18|close#18 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0216 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21700
     * @tc.name      testSessionGrid0217
     * @tc.desc      Verify scene 19 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0217 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 0');
      log.record('select#19 index=1');
      log.record('click#19');
      log.record('close#19 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 0');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 0|select#19 index=1|click#19|close#19 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0217 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21800
     * @tc.name      testSessionGrid0218
     * @tc.desc      Verify scene 19 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0218 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 1');
      log.record('check#19 checked=false');
      log.record('error#19 code2');
      log.record('close#19 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 1');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 1|check#19 checked=false|error#19 code2|close#19 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0218 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_21900
     * @tc.name      testSessionGrid0219
     * @tc.desc      Verify scene 19 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0219 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 2');
      log.record('select#19 index=1');
      log.record('select#19 index=2');
      log.record('click#19');
      log.record('close#19 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#19 scene 2');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 2|select#19 index=1|select#19 index=2|click#19|close#19 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0219 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22000
     * @tc.name      testSessionGrid0220
     * @tc.desc      Verify scene 19 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0220 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 3');
      log.record('error#19 code1');
      log.record('click#19');
      log.record('close#19 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 3');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 3|error#19 code1|click#19|close#19 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0220 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22100
     * @tc.name      testSessionGrid0221
     * @tc.desc      Verify scene 19 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0221 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 4');
      log.record('click#19');
      log.record('close#19 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#19 scene 4');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 4|click#19|close#19 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0221 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22200
     * @tc.name      testSessionGrid0222
     * @tc.desc      Verify scene 19 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0222 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 5');
      log.record('check#19 checked=false');
      log.record('check#19 checked=true');
      log.record('close#19 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 5');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 5|check#19 checked=false|check#19 checked=true|close#19 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0222 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22300
     * @tc.name      testSessionGrid0223
     * @tc.desc      Verify scene 19 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0223 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 6');
      log.record('select#19 index=1');
      log.record('check#19 checked=true');
      log.record('error#19 code3');
      log.record('close#19 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#19 scene 6');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 6|select#19 index=1|check#19 checked=true|error#19 code3|close#19 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0223 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22400
     * @tc.name      testSessionGrid0224
     * @tc.desc      Verify scene 19 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0224 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 7');
      log.record('click#19');
      log.record('select#19 index=2');
      log.record('close#19 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 7');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 7|click#19|select#19 index=2|close#19 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0224 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22500
     * @tc.name      testSessionGrid0225
     * @tc.desc      Verify scene 19 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0225 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 8');
      log.record('error#19 code1');
      log.record('error#19 code2');
      log.record('close#19 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 8');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 8|error#19 code1|error#19 code2|close#19 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0225 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22600
     * @tc.name      testSessionGrid0226
     * @tc.desc      Verify scene 19 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0226 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 9');
      log.record('select#19 index=1');
      log.record('click#19');
      log.record('check#19 checked=false');
      log.record('close#19 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#19 scene 9');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 9|select#19 index=1|click#19|check#19 checked=false|close#19 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0226 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22700
     * @tc.name      testSessionGrid0227
     * @tc.desc      Verify scene 19 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0227 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 10');
      log.record('check#19 checked=false');
      log.record('click#19');
      log.record('close#19 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#19 scene 10');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 10|check#19 checked=false|click#19|close#19 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0227 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22800
     * @tc.name      testSessionGrid0228
     * @tc.desc      Verify scene 19 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0228 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#19 scene 11');
      log.record('select#19 index=1');
      log.record('error#19 code2');
      log.record('click#19');
      log.record('close#19 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#19 scene 11');
      expect(log.hasPrefix('open#19')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#19 scene 11|select#19 index=1|error#19 code2|click#19|close#19 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0228 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_22900
     * @tc.name      testSessionGrid0229
     * @tc.desc      Verify scene 20 event pattern 1 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0229 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 0');
      log.record('select#20 index=1');
      log.record('click#20');
      log.record('close#20 scene 0');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 0');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 0|select#20 index=1|click#20|close#20 scene 0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0229 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23000
     * @tc.name      testSessionGrid0230
     * @tc.desc      Verify scene 20 event pattern 2 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0230 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 1');
      log.record('check#20 checked=false');
      log.record('error#20 code2');
      log.record('close#20 scene 1');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 1');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 1|check#20 checked=false|error#20 code2|close#20 scene 1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0230 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23100
     * @tc.name      testSessionGrid0231
     * @tc.desc      Verify scene 20 event pattern 3 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0231 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 2');
      log.record('select#20 index=1');
      log.record('select#20 index=2');
      log.record('click#20');
      log.record('close#20 scene 2');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#20 scene 2');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 2|select#20 index=1|select#20 index=2|click#20|close#20 scene 2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0231 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23200
     * @tc.name      testSessionGrid0232
     * @tc.desc      Verify scene 20 event pattern 4 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0232 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 3');
      log.record('error#20 code1');
      log.record('click#20');
      log.record('close#20 scene 3');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 3');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 3|error#20 code1|click#20|close#20 scene 3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0232 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23300
     * @tc.name      testSessionGrid0233
     * @tc.desc      Verify scene 20 event pattern 5 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0233 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 4');
      log.record('click#20');
      log.record('close#20 scene 4');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('close#20 scene 4');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 4|click#20|close#20 scene 4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0233 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23400
     * @tc.name      testSessionGrid0234
     * @tc.desc      Verify scene 20 event pattern 6 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0234 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 5');
      log.record('check#20 checked=false');
      log.record('check#20 checked=true');
      log.record('close#20 scene 5');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 5');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 5|check#20 checked=false|check#20 checked=true|close#20 scene 5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0234 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23500
     * @tc.name      testSessionGrid0235
     * @tc.desc      Verify scene 20 event pattern 7 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0235 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 6');
      log.record('select#20 index=1');
      log.record('check#20 checked=true');
      log.record('error#20 code3');
      log.record('close#20 scene 6');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#20 scene 6');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 6|select#20 index=1|check#20 checked=true|error#20 code3|close#20 scene 6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0235 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23600
     * @tc.name      testSessionGrid0236
     * @tc.desc      Verify scene 20 event pattern 8 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0236 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 7');
      log.record('click#20');
      log.record('select#20 index=2');
      log.record('close#20 scene 7');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 7');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 7|click#20|select#20 index=2|close#20 scene 7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0236 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23700
     * @tc.name      testSessionGrid0237
     * @tc.desc      Verify scene 20 event pattern 9 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0237 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 8');
      log.record('error#20 code1');
      log.record('error#20 code2');
      log.record('close#20 scene 8');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 8');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 8|error#20 code1|error#20 code2|close#20 scene 8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0237 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23800
     * @tc.name      testSessionGrid0238
     * @tc.desc      Verify scene 20 event pattern 10 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0238 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 9');
      log.record('select#20 index=1');
      log.record('click#20');
      log.record('check#20 checked=false');
      log.record('close#20 scene 9');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#20 scene 9');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 9|select#20 index=1|click#20|check#20 checked=false|close#20 scene 9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0238 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_23900
     * @tc.name      testSessionGrid0239
     * @tc.desc      Verify scene 20 event pattern 11 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0239 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 10');
      log.record('check#20 checked=false');
      log.record('click#20');
      log.record('close#20 scene 10');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('close#20 scene 10');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 10|check#20 checked=false|click#20|close#20 scene 10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0239 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_EVXP6_24000
     * @tc.name      testSessionGrid0240
     * @tc.desc      Verify scene 20 event pattern 12 order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSessionGrid0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0240 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#20 scene 11');
      log.record('select#20 index=1');
      log.record('error#20 code2');
      log.record('click#20');
      log.record('close#20 scene 11');
      expect(log.count()).assertEqual(5);
      expect(log.last()).assertEqual('close#20 scene 11');
      expect(log.hasPrefix('open#20')).assertTrue();
      expect(log.toLines().join("|")).assertEqual('open#20 scene 11|select#20 index=1|error#20 code2|click#20|close#20 scene 11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionGrid0240 end');
    })

  })
}
