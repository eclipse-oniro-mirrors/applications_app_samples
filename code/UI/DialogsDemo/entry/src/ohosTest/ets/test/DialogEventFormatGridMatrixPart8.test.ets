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

export default function DialogEventFormatGridMatrixPart8Test(): void {
  describe('DialogEventFormatGridMatrixPart8', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28100
     * @tc.name      testSelectGrid0281
     * @tc.desc      Verify formatSelect(12, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0281 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(12, 1)).assertEqual('select#12 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0281 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28200
     * @tc.name      testSelectGrid0282
     * @tc.desc      Verify formatSelect(12, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0282 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(12, 2)).assertEqual('select#12 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0282 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28300
     * @tc.name      testSelectGrid0283
     * @tc.desc      Verify formatSelect(12, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0283 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(12, 7)).assertEqual('select#12 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0283 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28400
     * @tc.name      testSelectGrid0284
     * @tc.desc      Verify formatSelect(12, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0284 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(12, 99)).assertEqual('select#12 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0284 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28500
     * @tc.name      testSelectGrid0285
     * @tc.desc      Verify formatSelect(13, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0285 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(13, -1)).assertEqual('select#13 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0285 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28600
     * @tc.name      testSelectGrid0286
     * @tc.desc      Verify formatSelect(13, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0286 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(13, 0)).assertEqual('select#13 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0286 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28700
     * @tc.name      testSelectGrid0287
     * @tc.desc      Verify formatSelect(13, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0287 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(13, 1)).assertEqual('select#13 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0287 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28800
     * @tc.name      testSelectGrid0288
     * @tc.desc      Verify formatSelect(13, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0288 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(13, 2)).assertEqual('select#13 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0288 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_28900
     * @tc.name      testSelectGrid0289
     * @tc.desc      Verify formatSelect(13, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0289 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(13, 7)).assertEqual('select#13 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0289 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29000
     * @tc.name      testSelectGrid0290
     * @tc.desc      Verify formatSelect(13, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0290 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(13, 99)).assertEqual('select#13 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0290 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29100
     * @tc.name      testSelectGrid0291
     * @tc.desc      Verify formatSelect(14, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0291 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(14, -1)).assertEqual('select#14 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0291 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29200
     * @tc.name      testSelectGrid0292
     * @tc.desc      Verify formatSelect(14, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0292 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(14, 0)).assertEqual('select#14 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0292 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29300
     * @tc.name      testSelectGrid0293
     * @tc.desc      Verify formatSelect(14, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0293 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(14, 1)).assertEqual('select#14 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0293 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29400
     * @tc.name      testSelectGrid0294
     * @tc.desc      Verify formatSelect(14, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0294 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(14, 2)).assertEqual('select#14 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0294 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29500
     * @tc.name      testSelectGrid0295
     * @tc.desc      Verify formatSelect(14, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0295 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(14, 7)).assertEqual('select#14 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0295 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29600
     * @tc.name      testSelectGrid0296
     * @tc.desc      Verify formatSelect(14, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0296 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(14, 99)).assertEqual('select#14 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0296 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29700
     * @tc.name      testSelectGrid0297
     * @tc.desc      Verify formatSelect(15, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0297 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(15, -1)).assertEqual('select#15 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0297 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29800
     * @tc.name      testSelectGrid0298
     * @tc.desc      Verify formatSelect(15, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0298 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(15, 0)).assertEqual('select#15 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0298 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_29900
     * @tc.name      testSelectGrid0299
     * @tc.desc      Verify formatSelect(15, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0299 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(15, 1)).assertEqual('select#15 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0299 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30000
     * @tc.name      testSelectGrid0300
     * @tc.desc      Verify formatSelect(15, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0300 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(15, 2)).assertEqual('select#15 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0300 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30100
     * @tc.name      testSelectGrid0301
     * @tc.desc      Verify formatSelect(15, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0301 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(15, 7)).assertEqual('select#15 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0301 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30200
     * @tc.name      testSelectGrid0302
     * @tc.desc      Verify formatSelect(15, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0302 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(15, 99)).assertEqual('select#15 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0302 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30300
     * @tc.name      testSelectGrid0303
     * @tc.desc      Verify formatSelect(16, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0303 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(16, -1)).assertEqual('select#16 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0303 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30400
     * @tc.name      testSelectGrid0304
     * @tc.desc      Verify formatSelect(16, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0304 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(16, 0)).assertEqual('select#16 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0304 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30500
     * @tc.name      testSelectGrid0305
     * @tc.desc      Verify formatSelect(16, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0305 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(16, 1)).assertEqual('select#16 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0305 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30600
     * @tc.name      testSelectGrid0306
     * @tc.desc      Verify formatSelect(16, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0306 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(16, 2)).assertEqual('select#16 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0306 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30700
     * @tc.name      testSelectGrid0307
     * @tc.desc      Verify formatSelect(16, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0307 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(16, 7)).assertEqual('select#16 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0307 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30800
     * @tc.name      testSelectGrid0308
     * @tc.desc      Verify formatSelect(16, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0308 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(16, 99)).assertEqual('select#16 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0308 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_30900
     * @tc.name      testSelectGrid0309
     * @tc.desc      Verify formatSelect(20, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0309 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(20, -1)).assertEqual('select#20 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0309 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31000
     * @tc.name      testSelectGrid0310
     * @tc.desc      Verify formatSelect(20, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0310 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(20, 0)).assertEqual('select#20 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0310 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31100
     * @tc.name      testSelectGrid0311
     * @tc.desc      Verify formatSelect(20, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0311 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(20, 1)).assertEqual('select#20 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0311 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31200
     * @tc.name      testSelectGrid0312
     * @tc.desc      Verify formatSelect(20, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0312 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(20, 2)).assertEqual('select#20 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0312 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31300
     * @tc.name      testSelectGrid0313
     * @tc.desc      Verify formatSelect(20, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0313 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(20, 7)).assertEqual('select#20 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0313 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31400
     * @tc.name      testSelectGrid0314
     * @tc.desc      Verify formatSelect(20, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0314 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(20, 99)).assertEqual('select#20 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0314 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31500
     * @tc.name      testSelectGrid0315
     * @tc.desc      Verify formatSelect(99, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0315 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(99, -1)).assertEqual('select#99 index=-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0315 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31600
     * @tc.name      testSelectGrid0316
     * @tc.desc      Verify formatSelect(99, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0316 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(99, 0)).assertEqual('select#99 index=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0316 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31700
     * @tc.name      testSelectGrid0317
     * @tc.desc      Verify formatSelect(99, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0317 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(99, 1)).assertEqual('select#99 index=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0317 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31800
     * @tc.name      testSelectGrid0318
     * @tc.desc      Verify formatSelect(99, 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0318 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(99, 2)).assertEqual('select#99 index=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0318 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_31900
     * @tc.name      testSelectGrid0319
     * @tc.desc      Verify formatSelect(99, 7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0319 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(99, 7)).assertEqual('select#99 index=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0319 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP8_32000
     * @tc.name      testSelectGrid0320
     * @tc.desc      Verify formatSelect(99, 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectGrid0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0320 begin');
      await delayTick();
      expect(DialogEventLog.formatSelect(99, 99)).assertEqual('select#99 index=99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectGrid0320 end');
    })

  })
}
