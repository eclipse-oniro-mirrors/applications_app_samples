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

export default function DialogEventFormatGridMatrixPart7Test(): void {
  describe('DialogEventFormatGridMatrixPart7', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24100
     * @tc.name      testSelectGrid0241
     * @tc.desc      Verify formatSelect(5, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0241 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(5, 7)).assertEqual('select#5 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0241 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24200
     * @tc.name      testSelectGrid0242
     * @tc.desc      Verify formatSelect(5, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0242 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(5, 99)).assertEqual('select#5 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0242 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24300
     * @tc.name      testSelectGrid0243
     * @tc.desc      Verify formatSelect(6, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0243 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(6, -1)).assertEqual('select#6 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0243 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24400
     * @tc.name      testSelectGrid0244
     * @tc.desc      Verify formatSelect(6, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0244 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(6, 0)).assertEqual('select#6 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0244 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24500
     * @tc.name      testSelectGrid0245
     * @tc.desc      Verify formatSelect(6, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0245 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(6, 1)).assertEqual('select#6 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0245 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24600
     * @tc.name      testSelectGrid0246
     * @tc.desc      Verify formatSelect(6, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0246 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(6, 2)).assertEqual('select#6 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0246 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24700
     * @tc.name      testSelectGrid0247
     * @tc.desc      Verify formatSelect(6, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0247 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(6, 7)).assertEqual('select#6 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0247 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24800
     * @tc.name      testSelectGrid0248
     * @tc.desc      Verify formatSelect(6, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0248 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(6, 99)).assertEqual('select#6 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0248 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_24900
     * @tc.name      testSelectGrid0249
     * @tc.desc      Verify formatSelect(7, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0249 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(7, -1)).assertEqual('select#7 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0249 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25000
     * @tc.name      testSelectGrid0250
     * @tc.desc      Verify formatSelect(7, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0250 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(7, 0)).assertEqual('select#7 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0250 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25100
     * @tc.name      testSelectGrid0251
     * @tc.desc      Verify formatSelect(7, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0251 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(7, 1)).assertEqual('select#7 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0251 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25200
     * @tc.name      testSelectGrid0252
     * @tc.desc      Verify formatSelect(7, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0252 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(7, 2)).assertEqual('select#7 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0252 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25300
     * @tc.name      testSelectGrid0253
     * @tc.desc      Verify formatSelect(7, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0253 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(7, 7)).assertEqual('select#7 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0253 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25400
     * @tc.name      testSelectGrid0254
     * @tc.desc      Verify formatSelect(7, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0254 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(7, 99)).assertEqual('select#7 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0254 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25500
     * @tc.name      testSelectGrid0255
     * @tc.desc      Verify formatSelect(8, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0255 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(8, -1)).assertEqual('select#8 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0255 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25600
     * @tc.name      testSelectGrid0256
     * @tc.desc      Verify formatSelect(8, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0256 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(8, 0)).assertEqual('select#8 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0256 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25700
     * @tc.name      testSelectGrid0257
     * @tc.desc      Verify formatSelect(8, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0257 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(8, 1)).assertEqual('select#8 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0257 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25800
     * @tc.name      testSelectGrid0258
     * @tc.desc      Verify formatSelect(8, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0258 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(8, 2)).assertEqual('select#8 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0258 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_25900
     * @tc.name      testSelectGrid0259
     * @tc.desc      Verify formatSelect(8, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0259 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(8, 7)).assertEqual('select#8 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0259 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26000
     * @tc.name      testSelectGrid0260
     * @tc.desc      Verify formatSelect(8, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0260 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(8, 99)).assertEqual('select#8 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0260 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26100
     * @tc.name      testSelectGrid0261
     * @tc.desc      Verify formatSelect(9, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0261 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(9, -1)).assertEqual('select#9 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0261 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26200
     * @tc.name      testSelectGrid0262
     * @tc.desc      Verify formatSelect(9, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0262 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(9, 0)).assertEqual('select#9 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0262 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26300
     * @tc.name      testSelectGrid0263
     * @tc.desc      Verify formatSelect(9, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0263 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(9, 1)).assertEqual('select#9 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0263 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26400
     * @tc.name      testSelectGrid0264
     * @tc.desc      Verify formatSelect(9, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0264 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(9, 2)).assertEqual('select#9 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0264 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26500
     * @tc.name      testSelectGrid0265
     * @tc.desc      Verify formatSelect(9, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0265 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(9, 7)).assertEqual('select#9 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0265 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26600
     * @tc.name      testSelectGrid0266
     * @tc.desc      Verify formatSelect(9, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0266 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(9, 99)).assertEqual('select#9 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0266 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26700
     * @tc.name      testSelectGrid0267
     * @tc.desc      Verify formatSelect(10, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0267 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(10, -1)).assertEqual('select#10 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0267 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26800
     * @tc.name      testSelectGrid0268
     * @tc.desc      Verify formatSelect(10, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0268 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(10, 0)).assertEqual('select#10 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0268 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_26900
     * @tc.name      testSelectGrid0269
     * @tc.desc      Verify formatSelect(10, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0269 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(10, 1)).assertEqual('select#10 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0269 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27000
     * @tc.name      testSelectGrid0270
     * @tc.desc      Verify formatSelect(10, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0270 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(10, 2)).assertEqual('select#10 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0270 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27100
     * @tc.name      testSelectGrid0271
     * @tc.desc      Verify formatSelect(10, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0271 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(10, 7)).assertEqual('select#10 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0271 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27200
     * @tc.name      testSelectGrid0272
     * @tc.desc      Verify formatSelect(10, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0272 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(10, 99)).assertEqual('select#10 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0272 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27300
     * @tc.name      testSelectGrid0273
     * @tc.desc      Verify formatSelect(11, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0273 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(11, -1)).assertEqual('select#11 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0273 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27400
     * @tc.name      testSelectGrid0274
     * @tc.desc      Verify formatSelect(11, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0274 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(11, 0)).assertEqual('select#11 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0274 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27500
     * @tc.name      testSelectGrid0275
     * @tc.desc      Verify formatSelect(11, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0275 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(11, 1)).assertEqual('select#11 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0275 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27600
     * @tc.name      testSelectGrid0276
     * @tc.desc      Verify formatSelect(11, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0276 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(11, 2)).assertEqual('select#11 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0276 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27700
     * @tc.name      testSelectGrid0277
     * @tc.desc      Verify formatSelect(11, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0277 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(11, 7)).assertEqual('select#11 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0277 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27800
     * @tc.name      testSelectGrid0278
     * @tc.desc      Verify formatSelect(11, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0278 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(11, 99)).assertEqual('select#11 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0278 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_27900
     * @tc.name      testSelectGrid0279
     * @tc.desc      Verify formatSelect(12, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0279 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(12, -1)).assertEqual('select#12 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0279 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP7_28000
     * @tc.name      testSelectGrid0280
     * @tc.desc      Verify formatSelect(12, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0280 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(12, 0)).assertEqual('select#12 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0280 end');
    })

  })
}
