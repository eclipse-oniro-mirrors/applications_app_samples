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

export default function DialogEventFormatGridMatrixPart6Test(): void {
  describe('DialogEventFormatGridMatrixPart6', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20100
     * @tc.name      testSelectGrid0201
     * @tc.desc      Verify formatSelect(-1, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0201 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(-1, -1)).assertEqual('select#-1 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0201 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20200
     * @tc.name      testSelectGrid0202
     * @tc.desc      Verify formatSelect(-1, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0202 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(-1, 0)).assertEqual('select#-1 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0202 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20300
     * @tc.name      testSelectGrid0203
     * @tc.desc      Verify formatSelect(-1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0203 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(-1, 1)).assertEqual('select#-1 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0203 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20400
     * @tc.name      testSelectGrid0204
     * @tc.desc      Verify formatSelect(-1, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0204 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(-1, 2)).assertEqual('select#-1 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0204 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20500
     * @tc.name      testSelectGrid0205
     * @tc.desc      Verify formatSelect(-1, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0205 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(-1, 7)).assertEqual('select#-1 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0205 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20600
     * @tc.name      testSelectGrid0206
     * @tc.desc      Verify formatSelect(-1, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0206 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(-1, 99)).assertEqual('select#-1 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0206 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20700
     * @tc.name      testSelectGrid0207
     * @tc.desc      Verify formatSelect(0, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0207 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(0, -1)).assertEqual('select#0 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0207 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20800
     * @tc.name      testSelectGrid0208
     * @tc.desc      Verify formatSelect(0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0208 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(0, 0)).assertEqual('select#0 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0208 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_20900
     * @tc.name      testSelectGrid0209
     * @tc.desc      Verify formatSelect(0, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0209 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(0, 1)).assertEqual('select#0 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0209 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21000
     * @tc.name      testSelectGrid0210
     * @tc.desc      Verify formatSelect(0, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0210 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(0, 2)).assertEqual('select#0 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0210 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21100
     * @tc.name      testSelectGrid0211
     * @tc.desc      Verify formatSelect(0, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0211 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(0, 7)).assertEqual('select#0 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0211 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21200
     * @tc.name      testSelectGrid0212
     * @tc.desc      Verify formatSelect(0, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0212 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(0, 99)).assertEqual('select#0 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0212 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21300
     * @tc.name      testSelectGrid0213
     * @tc.desc      Verify formatSelect(1, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0213 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(1, -1)).assertEqual('select#1 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0213 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21400
     * @tc.name      testSelectGrid0214
     * @tc.desc      Verify formatSelect(1, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0214 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(1, 0)).assertEqual('select#1 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0214 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21500
     * @tc.name      testSelectGrid0215
     * @tc.desc      Verify formatSelect(1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0215 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(1, 1)).assertEqual('select#1 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0215 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21600
     * @tc.name      testSelectGrid0216
     * @tc.desc      Verify formatSelect(1, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0216 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(1, 2)).assertEqual('select#1 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0216 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21700
     * @tc.name      testSelectGrid0217
     * @tc.desc      Verify formatSelect(1, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0217 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(1, 7)).assertEqual('select#1 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0217 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21800
     * @tc.name      testSelectGrid0218
     * @tc.desc      Verify formatSelect(1, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0218 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(1, 99)).assertEqual('select#1 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0218 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_21900
     * @tc.name      testSelectGrid0219
     * @tc.desc      Verify formatSelect(2, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0219 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(2, -1)).assertEqual('select#2 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0219 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22000
     * @tc.name      testSelectGrid0220
     * @tc.desc      Verify formatSelect(2, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0220 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(2, 0)).assertEqual('select#2 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0220 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22100
     * @tc.name      testSelectGrid0221
     * @tc.desc      Verify formatSelect(2, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0221 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(2, 1)).assertEqual('select#2 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0221 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22200
     * @tc.name      testSelectGrid0222
     * @tc.desc      Verify formatSelect(2, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0222 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(2, 2)).assertEqual('select#2 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0222 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22300
     * @tc.name      testSelectGrid0223
     * @tc.desc      Verify formatSelect(2, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0223 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(2, 7)).assertEqual('select#2 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0223 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22400
     * @tc.name      testSelectGrid0224
     * @tc.desc      Verify formatSelect(2, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0224 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(2, 99)).assertEqual('select#2 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0224 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22500
     * @tc.name      testSelectGrid0225
     * @tc.desc      Verify formatSelect(3, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0225 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(3, -1)).assertEqual('select#3 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0225 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22600
     * @tc.name      testSelectGrid0226
     * @tc.desc      Verify formatSelect(3, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0226 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(3, 0)).assertEqual('select#3 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0226 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22700
     * @tc.name      testSelectGrid0227
     * @tc.desc      Verify formatSelect(3, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0227 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(3, 1)).assertEqual('select#3 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0227 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22800
     * @tc.name      testSelectGrid0228
     * @tc.desc      Verify formatSelect(3, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0228 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(3, 2)).assertEqual('select#3 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0228 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_22900
     * @tc.name      testSelectGrid0229
     * @tc.desc      Verify formatSelect(3, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0229 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(3, 7)).assertEqual('select#3 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0229 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23000
     * @tc.name      testSelectGrid0230
     * @tc.desc      Verify formatSelect(3, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0230 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(3, 99)).assertEqual('select#3 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0230 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23100
     * @tc.name      testSelectGrid0231
     * @tc.desc      Verify formatSelect(4, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0231 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(4, -1)).assertEqual('select#4 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0231 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23200
     * @tc.name      testSelectGrid0232
     * @tc.desc      Verify formatSelect(4, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0232 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(4, 0)).assertEqual('select#4 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0232 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23300
     * @tc.name      testSelectGrid0233
     * @tc.desc      Verify formatSelect(4, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0233 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(4, 1)).assertEqual('select#4 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0233 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23400
     * @tc.name      testSelectGrid0234
     * @tc.desc      Verify formatSelect(4, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0234 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(4, 2)).assertEqual('select#4 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0234 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23500
     * @tc.name      testSelectGrid0235
     * @tc.desc      Verify formatSelect(4, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0235 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(4, 7)).assertEqual('select#4 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0235 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23600
     * @tc.name      testSelectGrid0236
     * @tc.desc      Verify formatSelect(4, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0236 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(4, 99)).assertEqual('select#4 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0236 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23700
     * @tc.name      testSelectGrid0237
     * @tc.desc      Verify formatSelect(5, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0237 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(5, -1)).assertEqual('select#5 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0237 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23800
     * @tc.name      testSelectGrid0238
     * @tc.desc      Verify formatSelect(5, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0238 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(5, 0)).assertEqual('select#5 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0238 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_23900
     * @tc.name      testSelectGrid0239
     * @tc.desc      Verify formatSelect(5, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0239 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(5, 1)).assertEqual('select#5 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0239 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP6_24000
     * @tc.name      testSelectGrid0240
     * @tc.desc      Verify formatSelect(5, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0240 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(5, 2)).assertEqual('select#5 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0240 end');
    })

  })
}
