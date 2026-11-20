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

export default function DialogEventFormatGridMatrixPart1Test(): void {
  describe('DialogEventFormatGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0100
     * @tc.name      testOpenGrid0001
     * @tc.desc      Verify formatOpen(-1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0001 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(-1, '')).assertEqual('open#-1 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0200
     * @tc.name      testOpenGrid0002
     * @tc.desc      Verify formatOpen(-1, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0002 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(-1, 'confirm')).assertEqual('open#-1 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0300
     * @tc.name      testOpenGrid0003
     * @tc.desc      Verify formatOpen(-1, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0003 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(-1, '确认')).assertEqual('open#-1 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0400
     * @tc.name      testOpenGrid0004
     * @tc.desc      Verify formatOpen(-1, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0004 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(-1, 'a b')).assertEqual('open#-1 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0500
     * @tc.name      testOpenGrid0005
     * @tc.desc      Verify formatOpen(-1, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0005 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(-1, '#tag')).assertEqual('open#-1 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0600
     * @tc.name      testOpenGrid0006
     * @tc.desc      Verify formatOpen(-1, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0006 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(-1, 'ok!')).assertEqual('open#-1 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0700
     * @tc.name      testOpenGrid0007
     * @tc.desc      Verify formatOpen(0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0007 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(0, '')).assertEqual('open#0 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0800
     * @tc.name      testOpenGrid0008
     * @tc.desc      Verify formatOpen(0, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0008 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(0, 'confirm')).assertEqual('open#0 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_0900
     * @tc.name      testOpenGrid0009
     * @tc.desc      Verify formatOpen(0, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0009 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(0, '确认')).assertEqual('open#0 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1000
     * @tc.name      testOpenGrid0010
     * @tc.desc      Verify formatOpen(0, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0010 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(0, 'a b')).assertEqual('open#0 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1100
     * @tc.name      testOpenGrid0011
     * @tc.desc      Verify formatOpen(0, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0011 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(0, '#tag')).assertEqual('open#0 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1200
     * @tc.name      testOpenGrid0012
     * @tc.desc      Verify formatOpen(0, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0012 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(0, 'ok!')).assertEqual('open#0 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1300
     * @tc.name      testOpenGrid0013
     * @tc.desc      Verify formatOpen(1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0013 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(1, '')).assertEqual('open#1 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1400
     * @tc.name      testOpenGrid0014
     * @tc.desc      Verify formatOpen(1, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0014 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(1, 'confirm')).assertEqual('open#1 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1500
     * @tc.name      testOpenGrid0015
     * @tc.desc      Verify formatOpen(1, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0015 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(1, '确认')).assertEqual('open#1 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1600
     * @tc.name      testOpenGrid0016
     * @tc.desc      Verify formatOpen(1, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0016 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(1, 'a b')).assertEqual('open#1 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1700
     * @tc.name      testOpenGrid0017
     * @tc.desc      Verify formatOpen(1, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0017 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(1, '#tag')).assertEqual('open#1 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1800
     * @tc.name      testOpenGrid0018
     * @tc.desc      Verify formatOpen(1, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0018 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(1, 'ok!')).assertEqual('open#1 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_1900
     * @tc.name      testOpenGrid0019
     * @tc.desc      Verify formatOpen(2, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0019 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(2, '')).assertEqual('open#2 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0019 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2000
     * @tc.name      testOpenGrid0020
     * @tc.desc      Verify formatOpen(2, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0020 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(2, 'confirm')).assertEqual('open#2 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0020 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2100
     * @tc.name      testOpenGrid0021
     * @tc.desc      Verify formatOpen(2, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0021 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(2, '确认')).assertEqual('open#2 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0021 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2200
     * @tc.name      testOpenGrid0022
     * @tc.desc      Verify formatOpen(2, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0022 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(2, 'a b')).assertEqual('open#2 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0022 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2300
     * @tc.name      testOpenGrid0023
     * @tc.desc      Verify formatOpen(2, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0023 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(2, '#tag')).assertEqual('open#2 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0023 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2400
     * @tc.name      testOpenGrid0024
     * @tc.desc      Verify formatOpen(2, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0024 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(2, 'ok!')).assertEqual('open#2 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0024 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2500
     * @tc.name      testOpenGrid0025
     * @tc.desc      Verify formatOpen(3, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0025 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(3, '')).assertEqual('open#3 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0025 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2600
     * @tc.name      testOpenGrid0026
     * @tc.desc      Verify formatOpen(3, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0026 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(3, 'confirm')).assertEqual('open#3 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0026 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2700
     * @tc.name      testOpenGrid0027
     * @tc.desc      Verify formatOpen(3, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0027 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(3, '确认')).assertEqual('open#3 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0027 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2800
     * @tc.name      testOpenGrid0028
     * @tc.desc      Verify formatOpen(3, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0028 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(3, 'a b')).assertEqual('open#3 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0028 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_2900
     * @tc.name      testOpenGrid0029
     * @tc.desc      Verify formatOpen(3, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0029 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(3, '#tag')).assertEqual('open#3 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0029 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3000
     * @tc.name      testOpenGrid0030
     * @tc.desc      Verify formatOpen(3, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0030 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(3, 'ok!')).assertEqual('open#3 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0030 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3100
     * @tc.name      testOpenGrid0031
     * @tc.desc      Verify formatOpen(4, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0031 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(4, '')).assertEqual('open#4 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0031 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3200
     * @tc.name      testOpenGrid0032
     * @tc.desc      Verify formatOpen(4, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0032 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(4, 'confirm')).assertEqual('open#4 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0032 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3300
     * @tc.name      testOpenGrid0033
     * @tc.desc      Verify formatOpen(4, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0033 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(4, '确认')).assertEqual('open#4 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0033 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3400
     * @tc.name      testOpenGrid0034
     * @tc.desc      Verify formatOpen(4, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0034 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(4, 'a b')).assertEqual('open#4 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0034 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3500
     * @tc.name      testOpenGrid0035
     * @tc.desc      Verify formatOpen(4, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0035 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(4, '#tag')).assertEqual('open#4 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0035 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3600
     * @tc.name      testOpenGrid0036
     * @tc.desc      Verify formatOpen(4, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0036 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(4, 'ok!')).assertEqual('open#4 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0036 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3700
     * @tc.name      testOpenGrid0037
     * @tc.desc      Verify formatOpen(5, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0037 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(5, '')).assertEqual('open#5 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0037 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3800
     * @tc.name      testOpenGrid0038
     * @tc.desc      Verify formatOpen(5, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0038 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(5, 'confirm')).assertEqual('open#5 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0038 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_3900
     * @tc.name      testOpenGrid0039
     * @tc.desc      Verify formatOpen(5, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0039 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(5, '确认')).assertEqual('open#5 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0039 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP1_4000
     * @tc.name      testOpenGrid0040
     * @tc.desc      Verify formatOpen(5, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0040 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(5, 'a b')).assertEqual('open#5 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0040 end');
    })

  })
}
