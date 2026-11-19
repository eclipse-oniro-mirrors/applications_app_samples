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

export default function DialogEventFormatGridMatrixPart5Test(): void {
  describe('DialogEventFormatGridMatrixPart5', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16100
     * @tc.name      testCloseGrid0161
     * @tc.desc      Verify formatClose(9, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0161 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(9, '')).assertEqual('close#9 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0161 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16200
     * @tc.name      testCloseGrid0162
     * @tc.desc      Verify formatClose(9, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0162 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(9, 'confirm')).assertEqual('close#9 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0162 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16300
     * @tc.name      testCloseGrid0163
     * @tc.desc      Verify formatClose(9, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0163 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(9, '确认')).assertEqual('close#9 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0163 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16400
     * @tc.name      testCloseGrid0164
     * @tc.desc      Verify formatClose(9, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0164 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(9, 'a b')).assertEqual('close#9 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0164 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16500
     * @tc.name      testCloseGrid0165
     * @tc.desc      Verify formatClose(10, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0165 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(10, '')).assertEqual('close#10 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0165 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16600
     * @tc.name      testCloseGrid0166
     * @tc.desc      Verify formatClose(10, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0166 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(10, 'confirm')).assertEqual('close#10 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0166 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16700
     * @tc.name      testCloseGrid0167
     * @tc.desc      Verify formatClose(10, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0167 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(10, '确认')).assertEqual('close#10 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0167 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16800
     * @tc.name      testCloseGrid0168
     * @tc.desc      Verify formatClose(10, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0168 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(10, 'a b')).assertEqual('close#10 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0168 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_16900
     * @tc.name      testCloseGrid0169
     * @tc.desc      Verify formatClose(11, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0169 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(11, '')).assertEqual('close#11 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0169 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17000
     * @tc.name      testCloseGrid0170
     * @tc.desc      Verify formatClose(11, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0170 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(11, 'confirm')).assertEqual('close#11 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0170 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17100
     * @tc.name      testCloseGrid0171
     * @tc.desc      Verify formatClose(11, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0171 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(11, '确认')).assertEqual('close#11 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0171 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17200
     * @tc.name      testCloseGrid0172
     * @tc.desc      Verify formatClose(11, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0172 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(11, 'a b')).assertEqual('close#11 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0172 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17300
     * @tc.name      testCloseGrid0173
     * @tc.desc      Verify formatClose(12, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0173 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(12, '')).assertEqual('close#12 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0173 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17400
     * @tc.name      testCloseGrid0174
     * @tc.desc      Verify formatClose(12, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0174 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(12, 'confirm')).assertEqual('close#12 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0174 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17500
     * @tc.name      testCloseGrid0175
     * @tc.desc      Verify formatClose(12, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0175 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(12, '确认')).assertEqual('close#12 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0175 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17600
     * @tc.name      testCloseGrid0176
     * @tc.desc      Verify formatClose(12, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0176 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(12, 'a b')).assertEqual('close#12 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0176 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17700
     * @tc.name      testCloseGrid0177
     * @tc.desc      Verify formatClose(13, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0177 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(13, '')).assertEqual('close#13 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0177 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17800
     * @tc.name      testCloseGrid0178
     * @tc.desc      Verify formatClose(13, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0178 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(13, 'confirm')).assertEqual('close#13 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0178 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_17900
     * @tc.name      testCloseGrid0179
     * @tc.desc      Verify formatClose(13, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0179 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(13, '确认')).assertEqual('close#13 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0179 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18000
     * @tc.name      testCloseGrid0180
     * @tc.desc      Verify formatClose(13, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0180 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(13, 'a b')).assertEqual('close#13 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0180 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18100
     * @tc.name      testCloseGrid0181
     * @tc.desc      Verify formatClose(14, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0181 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(14, '')).assertEqual('close#14 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0181 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18200
     * @tc.name      testCloseGrid0182
     * @tc.desc      Verify formatClose(14, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0182 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(14, 'confirm')).assertEqual('close#14 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0182 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18300
     * @tc.name      testCloseGrid0183
     * @tc.desc      Verify formatClose(14, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0183 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(14, '确认')).assertEqual('close#14 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0183 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18400
     * @tc.name      testCloseGrid0184
     * @tc.desc      Verify formatClose(14, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0184 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(14, 'a b')).assertEqual('close#14 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0184 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18500
     * @tc.name      testCloseGrid0185
     * @tc.desc      Verify formatClose(15, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0185 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(15, '')).assertEqual('close#15 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0185 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18600
     * @tc.name      testCloseGrid0186
     * @tc.desc      Verify formatClose(15, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0186 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(15, 'confirm')).assertEqual('close#15 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0186 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18700
     * @tc.name      testCloseGrid0187
     * @tc.desc      Verify formatClose(15, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0187 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(15, '确认')).assertEqual('close#15 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0187 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18800
     * @tc.name      testCloseGrid0188
     * @tc.desc      Verify formatClose(15, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0188 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(15, 'a b')).assertEqual('close#15 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0188 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_18900
     * @tc.name      testCloseGrid0189
     * @tc.desc      Verify formatClose(16, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0189 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(16, '')).assertEqual('close#16 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0189 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19000
     * @tc.name      testCloseGrid0190
     * @tc.desc      Verify formatClose(16, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0190 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(16, 'confirm')).assertEqual('close#16 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0190 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19100
     * @tc.name      testCloseGrid0191
     * @tc.desc      Verify formatClose(16, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0191 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(16, '确认')).assertEqual('close#16 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0191 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19200
     * @tc.name      testCloseGrid0192
     * @tc.desc      Verify formatClose(16, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0192 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(16, 'a b')).assertEqual('close#16 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0192 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19300
     * @tc.name      testCloseGrid0193
     * @tc.desc      Verify formatClose(20, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0193 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(20, '')).assertEqual('close#20 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0193 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19400
     * @tc.name      testCloseGrid0194
     * @tc.desc      Verify formatClose(20, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0194 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(20, 'confirm')).assertEqual('close#20 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0194 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19500
     * @tc.name      testCloseGrid0195
     * @tc.desc      Verify formatClose(20, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0195 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(20, '确认')).assertEqual('close#20 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0195 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19600
     * @tc.name      testCloseGrid0196
     * @tc.desc      Verify formatClose(20, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0196 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(20, 'a b')).assertEqual('close#20 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0196 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19700
     * @tc.name      testCloseGrid0197
     * @tc.desc      Verify formatClose(99, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0197 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(99, '')).assertEqual('close#99 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0197 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19800
     * @tc.name      testCloseGrid0198
     * @tc.desc      Verify formatClose(99, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0198 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(99, 'confirm')).assertEqual('close#99 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0198 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_19900
     * @tc.name      testCloseGrid0199
     * @tc.desc      Verify formatClose(99, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0199 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(99, '确认')).assertEqual('close#99 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0199 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP5_20000
     * @tc.name      testCloseGrid0200
     * @tc.desc      Verify formatClose(99, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCloseGrid0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0200 begin');
      await delayTick();
      expect(DialogEventLog.formatClose(99, 'a b')).assertEqual('close#99 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseGrid0200 end');
    })

  })
}
