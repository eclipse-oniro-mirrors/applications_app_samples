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

export default function DialogEventFormatGridMatrixPart2Test(): void {
  describe('DialogEventFormatGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4100
     * @tc.name      testOpenGrid0041
     * @tc.desc      Verify formatOpen(5, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0041 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(5, '#tag')).assertEqual('open#5 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0041 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4200
     * @tc.name      testOpenGrid0042
     * @tc.desc      Verify formatOpen(5, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0042 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(5, 'ok!')).assertEqual('open#5 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0042 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4300
     * @tc.name      testOpenGrid0043
     * @tc.desc      Verify formatOpen(6, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0043 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(6, '')).assertEqual('open#6 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0043 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4400
     * @tc.name      testOpenGrid0044
     * @tc.desc      Verify formatOpen(6, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0044 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(6, 'confirm')).assertEqual('open#6 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0044 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4500
     * @tc.name      testOpenGrid0045
     * @tc.desc      Verify formatOpen(6, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0045 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(6, '确认')).assertEqual('open#6 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0045 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4600
     * @tc.name      testOpenGrid0046
     * @tc.desc      Verify formatOpen(6, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0046 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(6, 'a b')).assertEqual('open#6 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0046 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4700
     * @tc.name      testOpenGrid0047
     * @tc.desc      Verify formatOpen(6, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0047 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(6, '#tag')).assertEqual('open#6 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0047 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4800
     * @tc.name      testOpenGrid0048
     * @tc.desc      Verify formatOpen(6, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0048 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(6, 'ok!')).assertEqual('open#6 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0048 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_4900
     * @tc.name      testOpenGrid0049
     * @tc.desc      Verify formatOpen(7, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0049 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(7, '')).assertEqual('open#7 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0049 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5000
     * @tc.name      testOpenGrid0050
     * @tc.desc      Verify formatOpen(7, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0050 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(7, 'confirm')).assertEqual('open#7 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0050 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5100
     * @tc.name      testOpenGrid0051
     * @tc.desc      Verify formatOpen(7, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0051 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(7, '确认')).assertEqual('open#7 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0051 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5200
     * @tc.name      testOpenGrid0052
     * @tc.desc      Verify formatOpen(7, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0052 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(7, 'a b')).assertEqual('open#7 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0052 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5300
     * @tc.name      testOpenGrid0053
     * @tc.desc      Verify formatOpen(7, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0053 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(7, '#tag')).assertEqual('open#7 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0053 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5400
     * @tc.name      testOpenGrid0054
     * @tc.desc      Verify formatOpen(7, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0054 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(7, 'ok!')).assertEqual('open#7 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0054 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5500
     * @tc.name      testOpenGrid0055
     * @tc.desc      Verify formatOpen(8, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0055 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(8, '')).assertEqual('open#8 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0055 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5600
     * @tc.name      testOpenGrid0056
     * @tc.desc      Verify formatOpen(8, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0056 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(8, 'confirm')).assertEqual('open#8 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0056 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5700
     * @tc.name      testOpenGrid0057
     * @tc.desc      Verify formatOpen(8, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0057 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(8, '确认')).assertEqual('open#8 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0057 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5800
     * @tc.name      testOpenGrid0058
     * @tc.desc      Verify formatOpen(8, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0058 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(8, 'a b')).assertEqual('open#8 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0058 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_5900
     * @tc.name      testOpenGrid0059
     * @tc.desc      Verify formatOpen(8, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0059 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(8, '#tag')).assertEqual('open#8 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0059 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6000
     * @tc.name      testOpenGrid0060
     * @tc.desc      Verify formatOpen(8, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0060 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(8, 'ok!')).assertEqual('open#8 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0060 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6100
     * @tc.name      testOpenGrid0061
     * @tc.desc      Verify formatOpen(9, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0061 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(9, '')).assertEqual('open#9 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0061 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6200
     * @tc.name      testOpenGrid0062
     * @tc.desc      Verify formatOpen(9, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0062 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(9, 'confirm')).assertEqual('open#9 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0062 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6300
     * @tc.name      testOpenGrid0063
     * @tc.desc      Verify formatOpen(9, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0063 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(9, '确认')).assertEqual('open#9 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0063 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6400
     * @tc.name      testOpenGrid0064
     * @tc.desc      Verify formatOpen(9, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0064 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(9, 'a b')).assertEqual('open#9 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0064 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6500
     * @tc.name      testOpenGrid0065
     * @tc.desc      Verify formatOpen(9, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0065 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(9, '#tag')).assertEqual('open#9 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0065 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6600
     * @tc.name      testOpenGrid0066
     * @tc.desc      Verify formatOpen(9, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0066 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(9, 'ok!')).assertEqual('open#9 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0066 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6700
     * @tc.name      testOpenGrid0067
     * @tc.desc      Verify formatOpen(10, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0067 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(10, '')).assertEqual('open#10 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0067 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6800
     * @tc.name      testOpenGrid0068
     * @tc.desc      Verify formatOpen(10, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0068 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(10, 'confirm')).assertEqual('open#10 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0068 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_6900
     * @tc.name      testOpenGrid0069
     * @tc.desc      Verify formatOpen(10, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0069 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(10, '确认')).assertEqual('open#10 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0069 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7000
     * @tc.name      testOpenGrid0070
     * @tc.desc      Verify formatOpen(10, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0070 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(10, 'a b')).assertEqual('open#10 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0070 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7100
     * @tc.name      testOpenGrid0071
     * @tc.desc      Verify formatOpen(10, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0071 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(10, '#tag')).assertEqual('open#10 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0071 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7200
     * @tc.name      testOpenGrid0072
     * @tc.desc      Verify formatOpen(10, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0072 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(10, 'ok!')).assertEqual('open#10 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0072 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7300
     * @tc.name      testOpenGrid0073
     * @tc.desc      Verify formatOpen(11, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0073 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(11, '')).assertEqual('open#11 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0073 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7400
     * @tc.name      testOpenGrid0074
     * @tc.desc      Verify formatOpen(11, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0074 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(11, 'confirm')).assertEqual('open#11 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0074 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7500
     * @tc.name      testOpenGrid0075
     * @tc.desc      Verify formatOpen(11, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0075 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(11, '确认')).assertEqual('open#11 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0075 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7600
     * @tc.name      testOpenGrid0076
     * @tc.desc      Verify formatOpen(11, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0076 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(11, 'a b')).assertEqual('open#11 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0076 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7700
     * @tc.name      testOpenGrid0077
     * @tc.desc      Verify formatOpen(11, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0077 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(11, '#tag')).assertEqual('open#11 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0077 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7800
     * @tc.name      testOpenGrid0078
     * @tc.desc      Verify formatOpen(11, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0078 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(11, 'ok!')).assertEqual('open#11 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0078 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_7900
     * @tc.name      testOpenGrid0079
     * @tc.desc      Verify formatOpen(12, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0079 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(12, '')).assertEqual('open#12 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0079 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP2_8000
     * @tc.name      testOpenGrid0080
     * @tc.desc      Verify formatOpen(12, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0080 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(12, 'confirm')).assertEqual('open#12 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0080 end');
    })

  })
}
