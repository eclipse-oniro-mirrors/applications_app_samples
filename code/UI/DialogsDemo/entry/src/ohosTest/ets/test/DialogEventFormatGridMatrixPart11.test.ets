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

export default function DialogEventFormatGridMatrixPart11Test(): void {
  describe('DialogEventFormatGridMatrixPart11', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40100
     * @tc.name      testErrorGrid0401
     * @tc.desc      Verify formatError(9, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0401 begin');
      await delayTick();
      expect(DialogEventLog.formatError(9, '')).assertEqual('error#9 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0401 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40200
     * @tc.name      testErrorGrid0402
     * @tc.desc      Verify formatError(9, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0402 begin');
      await delayTick();
      expect(DialogEventLog.formatError(9, 'denied')).assertEqual('error#9 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0402 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40300
     * @tc.name      testErrorGrid0403
     * @tc.desc      Verify formatError(9, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0403 begin');
      await delayTick();
      expect(DialogEventLog.formatError(9, '中文')).assertEqual('error#9 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0403 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40400
     * @tc.name      testErrorGrid0404
     * @tc.desc      Verify formatError(9, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0404 begin');
      await delayTick();
      expect(DialogEventLog.formatError(9, 'a b')).assertEqual('error#9 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0404 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40500
     * @tc.name      testErrorGrid0405
     * @tc.desc      Verify formatError(10, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0405 begin');
      await delayTick();
      expect(DialogEventLog.formatError(10, '')).assertEqual('error#10 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0405 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40600
     * @tc.name      testErrorGrid0406
     * @tc.desc      Verify formatError(10, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0406 begin');
      await delayTick();
      expect(DialogEventLog.formatError(10, 'denied')).assertEqual('error#10 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0406 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40700
     * @tc.name      testErrorGrid0407
     * @tc.desc      Verify formatError(10, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0407 begin');
      await delayTick();
      expect(DialogEventLog.formatError(10, '中文')).assertEqual('error#10 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0407 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40800
     * @tc.name      testErrorGrid0408
     * @tc.desc      Verify formatError(10, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0408 begin');
      await delayTick();
      expect(DialogEventLog.formatError(10, 'a b')).assertEqual('error#10 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0408 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_40900
     * @tc.name      testErrorGrid0409
     * @tc.desc      Verify formatError(11, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0409 begin');
      await delayTick();
      expect(DialogEventLog.formatError(11, '')).assertEqual('error#11 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0409 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41000
     * @tc.name      testErrorGrid0410
     * @tc.desc      Verify formatError(11, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0410 begin');
      await delayTick();
      expect(DialogEventLog.formatError(11, 'denied')).assertEqual('error#11 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0410 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41100
     * @tc.name      testErrorGrid0411
     * @tc.desc      Verify formatError(11, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0411 begin');
      await delayTick();
      expect(DialogEventLog.formatError(11, '中文')).assertEqual('error#11 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0411 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41200
     * @tc.name      testErrorGrid0412
     * @tc.desc      Verify formatError(11, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0412 begin');
      await delayTick();
      expect(DialogEventLog.formatError(11, 'a b')).assertEqual('error#11 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0412 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41300
     * @tc.name      testErrorGrid0413
     * @tc.desc      Verify formatError(12, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0413 begin');
      await delayTick();
      expect(DialogEventLog.formatError(12, '')).assertEqual('error#12 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0413 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41400
     * @tc.name      testErrorGrid0414
     * @tc.desc      Verify formatError(12, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0414 begin');
      await delayTick();
      expect(DialogEventLog.formatError(12, 'denied')).assertEqual('error#12 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0414 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41500
     * @tc.name      testErrorGrid0415
     * @tc.desc      Verify formatError(12, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0415 begin');
      await delayTick();
      expect(DialogEventLog.formatError(12, '中文')).assertEqual('error#12 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0415 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41600
     * @tc.name      testErrorGrid0416
     * @tc.desc      Verify formatError(12, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0416 begin');
      await delayTick();
      expect(DialogEventLog.formatError(12, 'a b')).assertEqual('error#12 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0416 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41700
     * @tc.name      testErrorGrid0417
     * @tc.desc      Verify formatError(13, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0417 begin');
      await delayTick();
      expect(DialogEventLog.formatError(13, '')).assertEqual('error#13 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0417 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41800
     * @tc.name      testErrorGrid0418
     * @tc.desc      Verify formatError(13, 'denied').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0418 begin');
      await delayTick();
      expect(DialogEventLog.formatError(13, 'denied')).assertEqual('error#13 denied');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0418 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_41900
     * @tc.name      testErrorGrid0419
     * @tc.desc      Verify formatError(13, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0419 begin');
      await delayTick();
      expect(DialogEventLog.formatError(13, '中文')).assertEqual('error#13 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0419 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP11_42000
     * @tc.name      testErrorGrid0420
     * @tc.desc      Verify formatError(13, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorGrid0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0420 begin');
      await delayTick();
      expect(DialogEventLog.formatError(13, 'a b')).assertEqual('error#13 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorGrid0420 end');
    })

  })
}
