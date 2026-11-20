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

export default function DialogEventFormatGridMatrixPart9Test(): void {
  describe('DialogEventFormatGridMatrixPart9', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32100
     * @tc.name      testCheckGrid0321
     * @tc.desc      Verify formatCheck(-1, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0321 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(-1, true)).assertEqual('check#-1 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0321 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32200
     * @tc.name      testCheckGrid0322
     * @tc.desc      Verify formatCheck(-1, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0322 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(-1, false)).assertEqual('check#-1 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0322 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32300
     * @tc.name      testCheckGrid0323
     * @tc.desc      Verify formatCheck(0, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0323 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(0, true)).assertEqual('check#0 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0323 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32400
     * @tc.name      testCheckGrid0324
     * @tc.desc      Verify formatCheck(0, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0324 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(0, false)).assertEqual('check#0 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0324 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32500
     * @tc.name      testCheckGrid0325
     * @tc.desc      Verify formatCheck(1, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0325 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(1, true)).assertEqual('check#1 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0325 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32600
     * @tc.name      testCheckGrid0326
     * @tc.desc      Verify formatCheck(1, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0326 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(1, false)).assertEqual('check#1 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0326 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32700
     * @tc.name      testCheckGrid0327
     * @tc.desc      Verify formatCheck(2, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0327 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(2, true)).assertEqual('check#2 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0327 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32800
     * @tc.name      testCheckGrid0328
     * @tc.desc      Verify formatCheck(2, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0328 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(2, false)).assertEqual('check#2 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0328 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_32900
     * @tc.name      testCheckGrid0329
     * @tc.desc      Verify formatCheck(3, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0329 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(3, true)).assertEqual('check#3 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0329 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33000
     * @tc.name      testCheckGrid0330
     * @tc.desc      Verify formatCheck(3, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0330 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(3, false)).assertEqual('check#3 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0330 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33100
     * @tc.name      testCheckGrid0331
     * @tc.desc      Verify formatCheck(4, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0331 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(4, true)).assertEqual('check#4 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0331 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33200
     * @tc.name      testCheckGrid0332
     * @tc.desc      Verify formatCheck(4, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0332 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(4, false)).assertEqual('check#4 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0332 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33300
     * @tc.name      testCheckGrid0333
     * @tc.desc      Verify formatCheck(5, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0333 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(5, true)).assertEqual('check#5 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0333 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33400
     * @tc.name      testCheckGrid0334
     * @tc.desc      Verify formatCheck(5, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0334 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(5, false)).assertEqual('check#5 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0334 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33500
     * @tc.name      testCheckGrid0335
     * @tc.desc      Verify formatCheck(6, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0335 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(6, true)).assertEqual('check#6 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0335 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33600
     * @tc.name      testCheckGrid0336
     * @tc.desc      Verify formatCheck(6, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0336 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(6, false)).assertEqual('check#6 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0336 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33700
     * @tc.name      testCheckGrid0337
     * @tc.desc      Verify formatCheck(7, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0337 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(7, true)).assertEqual('check#7 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0337 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33800
     * @tc.name      testCheckGrid0338
     * @tc.desc      Verify formatCheck(7, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0338 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(7, false)).assertEqual('check#7 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0338 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_33900
     * @tc.name      testCheckGrid0339
     * @tc.desc      Verify formatCheck(8, true).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0339 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(8, true)).assertEqual('check#8 checked=true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0339 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34000
     * @tc.name      testCheckGrid0340
     * @tc.desc      Verify formatCheck(8, false).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCheckGrid0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0340 begin');
      await delayTick();
      expect(DialogEventLog.formatCheck(8, false)).assertEqual('check#8 checked=false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCheckGrid0340 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34100
     * @tc.name      testClickGrid0341
     * @tc.desc      Verify formatClick(-1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0341 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(-1)).assertEqual('click#-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0341 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34200
     * @tc.name      testClickGrid0342
     * @tc.desc      Verify formatClick(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0342 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(0)).assertEqual('click#0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0342 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34300
     * @tc.name      testClickGrid0343
     * @tc.desc      Verify formatClick(1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0343 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(1)).assertEqual('click#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0343 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34400
     * @tc.name      testClickGrid0344
     * @tc.desc      Verify formatClick(2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0344 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(2)).assertEqual('click#2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0344 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34500
     * @tc.name      testClickGrid0345
     * @tc.desc      Verify formatClick(3).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0345 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(3)).assertEqual('click#3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0345 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34600
     * @tc.name      testClickGrid0346
     * @tc.desc      Verify formatClick(4).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0346 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(4)).assertEqual('click#4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0346 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34700
     * @tc.name      testClickGrid0347
     * @tc.desc      Verify formatClick(5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0347 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(5)).assertEqual('click#5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0347 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34800
     * @tc.name      testClickGrid0348
     * @tc.desc      Verify formatClick(6).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0348 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(6)).assertEqual('click#6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0348 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_34900
     * @tc.name      testClickGrid0349
     * @tc.desc      Verify formatClick(7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0349 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(7)).assertEqual('click#7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0349 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35000
     * @tc.name      testClickGrid0350
     * @tc.desc      Verify formatClick(8).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0350 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(8)).assertEqual('click#8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0350 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35100
     * @tc.name      testClickGrid0351
     * @tc.desc      Verify formatClick(9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0351 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(9)).assertEqual('click#9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0351 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35200
     * @tc.name      testClickGrid0352
     * @tc.desc      Verify formatClick(10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0352 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(10)).assertEqual('click#10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0352 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35300
     * @tc.name      testClickGrid0353
     * @tc.desc      Verify formatClick(11).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0353 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(11)).assertEqual('click#11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0353 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35400
     * @tc.name      testClickGrid0354
     * @tc.desc      Verify formatClick(12).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0354 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(12)).assertEqual('click#12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0354 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35500
     * @tc.name      testClickGrid0355
     * @tc.desc      Verify formatClick(13).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0355 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(13)).assertEqual('click#13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0355 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35600
     * @tc.name      testClickGrid0356
     * @tc.desc      Verify formatClick(14).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0356 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(14)).assertEqual('click#14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0356 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35700
     * @tc.name      testClickGrid0357
     * @tc.desc      Verify formatClick(15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0357 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(15)).assertEqual('click#15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0357 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35800
     * @tc.name      testClickGrid0358
     * @tc.desc      Verify formatClick(16).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0358 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(16)).assertEqual('click#16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0358 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_35900
     * @tc.name      testClickGrid0359
     * @tc.desc      Verify formatClick(20).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0359 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(20)).assertEqual('click#20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0359 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP9_36000
     * @tc.name      testClickGrid0360
     * @tc.desc      Verify formatClick(99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClickGrid0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0360 begin');
      await delayTick();
      expect(DialogEventLog.formatClick(99)).assertEqual('click#99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickGrid0360 end');
    })

  })
}
