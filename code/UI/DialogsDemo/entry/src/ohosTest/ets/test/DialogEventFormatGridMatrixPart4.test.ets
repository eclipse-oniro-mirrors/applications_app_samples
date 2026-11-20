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

export default function DialogEventFormatGridMatrixPart4Test(): void {
  describe('DialogEventFormatGridMatrixPart4', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12100
     * @tc.name      testCloseGrid0121
     * @tc.desc      Verify formatClose(-1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0121 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(-1, '')).assertEqual('close#-1 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0121 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12200
     * @tc.name      testCloseGrid0122
     * @tc.desc      Verify formatClose(-1, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0122 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(-1, 'confirm')).assertEqual('close#-1 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0122 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12300
     * @tc.name      testCloseGrid0123
     * @tc.desc      Verify formatClose(-1, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0123 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(-1, '确认')).assertEqual('close#-1 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0123 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12400
     * @tc.name      testCloseGrid0124
     * @tc.desc      Verify formatClose(-1, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0124 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(-1, 'a b')).assertEqual('close#-1 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0124 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12500
     * @tc.name      testCloseGrid0125
     * @tc.desc      Verify formatClose(0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0125 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(0, '')).assertEqual('close#0 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0125 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12600
     * @tc.name      testCloseGrid0126
     * @tc.desc      Verify formatClose(0, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0126 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(0, 'confirm')).assertEqual('close#0 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0126 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12700
     * @tc.name      testCloseGrid0127
     * @tc.desc      Verify formatClose(0, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0127 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(0, '确认')).assertEqual('close#0 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0127 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12800
     * @tc.name      testCloseGrid0128
     * @tc.desc      Verify formatClose(0, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0128 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(0, 'a b')).assertEqual('close#0 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0128 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_12900
     * @tc.name      testCloseGrid0129
     * @tc.desc      Verify formatClose(1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0129 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(1, '')).assertEqual('close#1 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0129 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13000
     * @tc.name      testCloseGrid0130
     * @tc.desc      Verify formatClose(1, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0130 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(1, 'confirm')).assertEqual('close#1 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0130 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13100
     * @tc.name      testCloseGrid0131
     * @tc.desc      Verify formatClose(1, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0131 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(1, '确认')).assertEqual('close#1 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0131 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13200
     * @tc.name      testCloseGrid0132
     * @tc.desc      Verify formatClose(1, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0132 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(1, 'a b')).assertEqual('close#1 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0132 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13300
     * @tc.name      testCloseGrid0133
     * @tc.desc      Verify formatClose(2, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0133 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(2, '')).assertEqual('close#2 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0133 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13400
     * @tc.name      testCloseGrid0134
     * @tc.desc      Verify formatClose(2, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0134 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(2, 'confirm')).assertEqual('close#2 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0134 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13500
     * @tc.name      testCloseGrid0135
     * @tc.desc      Verify formatClose(2, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0135 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(2, '确认')).assertEqual('close#2 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0135 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13600
     * @tc.name      testCloseGrid0136
     * @tc.desc      Verify formatClose(2, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0136 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(2, 'a b')).assertEqual('close#2 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0136 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13700
     * @tc.name      testCloseGrid0137
     * @tc.desc      Verify formatClose(3, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0137 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(3, '')).assertEqual('close#3 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0137 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13800
     * @tc.name      testCloseGrid0138
     * @tc.desc      Verify formatClose(3, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0138 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(3, 'confirm')).assertEqual('close#3 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0138 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_13900
     * @tc.name      testCloseGrid0139
     * @tc.desc      Verify formatClose(3, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0139 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(3, '确认')).assertEqual('close#3 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0139 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14000
     * @tc.name      testCloseGrid0140
     * @tc.desc      Verify formatClose(3, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0140 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(3, 'a b')).assertEqual('close#3 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0140 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14100
     * @tc.name      testCloseGrid0141
     * @tc.desc      Verify formatClose(4, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0141 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(4, '')).assertEqual('close#4 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0141 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14200
     * @tc.name      testCloseGrid0142
     * @tc.desc      Verify formatClose(4, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0142 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(4, 'confirm')).assertEqual('close#4 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0142 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14300
     * @tc.name      testCloseGrid0143
     * @tc.desc      Verify formatClose(4, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0143 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(4, '确认')).assertEqual('close#4 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0143 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14400
     * @tc.name      testCloseGrid0144
     * @tc.desc      Verify formatClose(4, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0144 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(4, 'a b')).assertEqual('close#4 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0144 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14500
     * @tc.name      testCloseGrid0145
     * @tc.desc      Verify formatClose(5, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0145 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(5, '')).assertEqual('close#5 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0145 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14600
     * @tc.name      testCloseGrid0146
     * @tc.desc      Verify formatClose(5, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0146 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(5, 'confirm')).assertEqual('close#5 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0146 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14700
     * @tc.name      testCloseGrid0147
     * @tc.desc      Verify formatClose(5, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0147 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(5, '确认')).assertEqual('close#5 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0147 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14800
     * @tc.name      testCloseGrid0148
     * @tc.desc      Verify formatClose(5, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0148 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(5, 'a b')).assertEqual('close#5 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0148 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_14900
     * @tc.name      testCloseGrid0149
     * @tc.desc      Verify formatClose(6, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0149 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(6, '')).assertEqual('close#6 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0149 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15000
     * @tc.name      testCloseGrid0150
     * @tc.desc      Verify formatClose(6, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0150 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(6, 'confirm')).assertEqual('close#6 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0150 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15100
     * @tc.name      testCloseGrid0151
     * @tc.desc      Verify formatClose(6, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0151 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(6, '确认')).assertEqual('close#6 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0151 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15200
     * @tc.name      testCloseGrid0152
     * @tc.desc      Verify formatClose(6, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0152 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(6, 'a b')).assertEqual('close#6 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0152 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15300
     * @tc.name      testCloseGrid0153
     * @tc.desc      Verify formatClose(7, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0153 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(7, '')).assertEqual('close#7 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0153 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15400
     * @tc.name      testCloseGrid0154
     * @tc.desc      Verify formatClose(7, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0154 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(7, 'confirm')).assertEqual('close#7 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0154 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15500
     * @tc.name      testCloseGrid0155
     * @tc.desc      Verify formatClose(7, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0155 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(7, '确认')).assertEqual('close#7 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0155 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15600
     * @tc.name      testCloseGrid0156
     * @tc.desc      Verify formatClose(7, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0156 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(7, 'a b')).assertEqual('close#7 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0156 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15700
     * @tc.name      testCloseGrid0157
     * @tc.desc      Verify formatClose(8, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0157 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(8, '')).assertEqual('close#8 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0157 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15800
     * @tc.name      testCloseGrid0158
     * @tc.desc      Verify formatClose(8, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0158 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(8, 'confirm')).assertEqual('close#8 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0158 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_15900
     * @tc.name      testCloseGrid0159
     * @tc.desc      Verify formatClose(8, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0159 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(8, '确认')).assertEqual('close#8 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0159 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP4_16000
     * @tc.name      testCloseGrid0160
     * @tc.desc      Verify formatClose(8, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0160 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(8, 'a b')).assertEqual('close#8 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0160 end');
    })

  })
}
