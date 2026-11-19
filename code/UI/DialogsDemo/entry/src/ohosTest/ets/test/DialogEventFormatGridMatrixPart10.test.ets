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

export default function DialogEventFormatGridMatrixPart10Test(): void {
  describe('DialogEventFormatGridMatrixPart10', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36100
     * @tc.name      testErrorGrid0361
     * @tc.desc      Verify formatError(-1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0361 begin');
      await delayTick();
      expect(DialogEventLog.formatError(-1, '')).assertEqual('error#-1 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0361 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36200
     * @tc.name      testErrorGrid0362
     * @tc.desc      Verify formatError(-1, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0362 begin');
      await delayTick();
      expect(DialogEventLog.formatError(-1, 'denied')).assertEqual('error#-1 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0362 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36300
     * @tc.name      testErrorGrid0363
     * @tc.desc      Verify formatError(-1, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0363 begin');
      await delayTick();
      expect(DialogEventLog.formatError(-1, '中文')).assertEqual('error#-1 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0363 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36400
     * @tc.name      testErrorGrid0364
     * @tc.desc      Verify formatError(-1, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0364 begin');
      await delayTick();
      expect(DialogEventLog.formatError(-1, 'a b')).assertEqual('error#-1 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0364 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36500
     * @tc.name      testErrorGrid0365
     * @tc.desc      Verify formatError(0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0365 begin');
      await delayTick();
      expect(DialogEventLog.formatError(0, '')).assertEqual('error#0 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0365 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36600
     * @tc.name      testErrorGrid0366
     * @tc.desc      Verify formatError(0, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0366 begin');
      await delayTick();
      expect(DialogEventLog.formatError(0, 'denied')).assertEqual('error#0 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0366 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36700
     * @tc.name      testErrorGrid0367
     * @tc.desc      Verify formatError(0, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0367 begin');
      await delayTick();
      expect(DialogEventLog.formatError(0, '中文')).assertEqual('error#0 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0367 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36800
     * @tc.name      testErrorGrid0368
     * @tc.desc      Verify formatError(0, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0368 begin');
      await delayTick();
      expect(DialogEventLog.formatError(0, 'a b')).assertEqual('error#0 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0368 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_36900
     * @tc.name      testErrorGrid0369
     * @tc.desc      Verify formatError(1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0369 begin');
      await delayTick();
      expect(DialogEventLog.formatError(1, '')).assertEqual('error#1 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0369 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37000
     * @tc.name      testErrorGrid0370
     * @tc.desc      Verify formatError(1, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0370 begin');
      await delayTick();
      expect(DialogEventLog.formatError(1, 'denied')).assertEqual('error#1 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0370 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37100
     * @tc.name      testErrorGrid0371
     * @tc.desc      Verify formatError(1, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0371 begin');
      await delayTick();
      expect(DialogEventLog.formatError(1, '中文')).assertEqual('error#1 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0371 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37200
     * @tc.name      testErrorGrid0372
     * @tc.desc      Verify formatError(1, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0372 begin');
      await delayTick();
      expect(DialogEventLog.formatError(1, 'a b')).assertEqual('error#1 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0372 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37300
     * @tc.name      testErrorGrid0373
     * @tc.desc      Verify formatError(2, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0373 begin');
      await delayTick();
      expect(DialogEventLog.formatError(2, '')).assertEqual('error#2 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0373 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37400
     * @tc.name      testErrorGrid0374
     * @tc.desc      Verify formatError(2, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0374 begin');
      await delayTick();
      expect(DialogEventLog.formatError(2, 'denied')).assertEqual('error#2 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0374 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37500
     * @tc.name      testErrorGrid0375
     * @tc.desc      Verify formatError(2, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0375 begin');
      await delayTick();
      expect(DialogEventLog.formatError(2, '中文')).assertEqual('error#2 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0375 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37600
     * @tc.name      testErrorGrid0376
     * @tc.desc      Verify formatError(2, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0376 begin');
      await delayTick();
      expect(DialogEventLog.formatError(2, 'a b')).assertEqual('error#2 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0376 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37700
     * @tc.name      testErrorGrid0377
     * @tc.desc      Verify formatError(3, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0377 begin');
      await delayTick();
      expect(DialogEventLog.formatError(3, '')).assertEqual('error#3 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0377 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37800
     * @tc.name      testErrorGrid0378
     * @tc.desc      Verify formatError(3, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0378 begin');
      await delayTick();
      expect(DialogEventLog.formatError(3, 'denied')).assertEqual('error#3 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0378 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_37900
     * @tc.name      testErrorGrid0379
     * @tc.desc      Verify formatError(3, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0379 begin');
      await delayTick();
      expect(DialogEventLog.formatError(3, '中文')).assertEqual('error#3 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0379 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38000
     * @tc.name      testErrorGrid0380
     * @tc.desc      Verify formatError(3, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0380 begin');
      await delayTick();
      expect(DialogEventLog.formatError(3, 'a b')).assertEqual('error#3 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0380 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38100
     * @tc.name      testErrorGrid0381
     * @tc.desc      Verify formatError(4, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0381 begin');
      await delayTick();
      expect(DialogEventLog.formatError(4, '')).assertEqual('error#4 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0381 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38200
     * @tc.name      testErrorGrid0382
     * @tc.desc      Verify formatError(4, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0382 begin');
      await delayTick();
      expect(DialogEventLog.formatError(4, 'denied')).assertEqual('error#4 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0382 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38300
     * @tc.name      testErrorGrid0383
     * @tc.desc      Verify formatError(4, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0383 begin');
      await delayTick();
      expect(DialogEventLog.formatError(4, '中文')).assertEqual('error#4 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0383 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38400
     * @tc.name      testErrorGrid0384
     * @tc.desc      Verify formatError(4, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0384 begin');
      await delayTick();
      expect(DialogEventLog.formatError(4, 'a b')).assertEqual('error#4 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0384 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38500
     * @tc.name      testErrorGrid0385
     * @tc.desc      Verify formatError(5, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0385 begin');
      await delayTick();
      expect(DialogEventLog.formatError(5, '')).assertEqual('error#5 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0385 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38600
     * @tc.name      testErrorGrid0386
     * @tc.desc      Verify formatError(5, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0386 begin');
      await delayTick();
      expect(DialogEventLog.formatError(5, 'denied')).assertEqual('error#5 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0386 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38700
     * @tc.name      testErrorGrid0387
     * @tc.desc      Verify formatError(5, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0387 begin');
      await delayTick();
      expect(DialogEventLog.formatError(5, '中文')).assertEqual('error#5 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0387 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38800
     * @tc.name      testErrorGrid0388
     * @tc.desc      Verify formatError(5, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0388 begin');
      await delayTick();
      expect(DialogEventLog.formatError(5, 'a b')).assertEqual('error#5 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0388 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_38900
     * @tc.name      testErrorGrid0389
     * @tc.desc      Verify formatError(6, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0389 begin');
      await delayTick();
      expect(DialogEventLog.formatError(6, '')).assertEqual('error#6 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0389 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39000
     * @tc.name      testErrorGrid0390
     * @tc.desc      Verify formatError(6, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0390 begin');
      await delayTick();
      expect(DialogEventLog.formatError(6, 'denied')).assertEqual('error#6 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0390 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39100
     * @tc.name      testErrorGrid0391
     * @tc.desc      Verify formatError(6, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0391 begin');
      await delayTick();
      expect(DialogEventLog.formatError(6, '中文')).assertEqual('error#6 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0391 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39200
     * @tc.name      testErrorGrid0392
     * @tc.desc      Verify formatError(6, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0392 begin');
      await delayTick();
      expect(DialogEventLog.formatError(6, 'a b')).assertEqual('error#6 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0392 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39300
     * @tc.name      testErrorGrid0393
     * @tc.desc      Verify formatError(7, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0393 begin');
      await delayTick();
      expect(DialogEventLog.formatError(7, '')).assertEqual('error#7 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0393 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39400
     * @tc.name      testErrorGrid0394
     * @tc.desc      Verify formatError(7, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0394 begin');
      await delayTick();
      expect(DialogEventLog.formatError(7, 'denied')).assertEqual('error#7 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0394 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39500
     * @tc.name      testErrorGrid0395
     * @tc.desc      Verify formatError(7, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0395 begin');
      await delayTick();
      expect(DialogEventLog.formatError(7, '中文')).assertEqual('error#7 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0395 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39600
     * @tc.name      testErrorGrid0396
     * @tc.desc      Verify formatError(7, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0396 begin');
      await delayTick();
      expect(DialogEventLog.formatError(7, 'a b')).assertEqual('error#7 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0396 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39700
     * @tc.name      testErrorGrid0397
     * @tc.desc      Verify formatError(8, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0397 begin');
      await delayTick();
      expect(DialogEventLog.formatError(8, '')).assertEqual('error#8 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0397 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39800
     * @tc.name      testErrorGrid0398
     * @tc.desc      Verify formatError(8, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0398 begin');
      await delayTick();
      expect(DialogEventLog.formatError(8, 'denied')).assertEqual('error#8 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0398 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_39900
     * @tc.name      testErrorGrid0399
     * @tc.desc      Verify formatError(8, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0399 begin');
      await delayTick();
      expect(DialogEventLog.formatError(8, '中文')).assertEqual('error#8 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0399 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP10_40000
     * @tc.name      testErrorGrid0400
     * @tc.desc      Verify formatError(8, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0400 begin');
      await delayTick();
      expect(DialogEventLog.formatError(8, 'a b')).assertEqual('error#8 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0400 end');
    })

  })
}
