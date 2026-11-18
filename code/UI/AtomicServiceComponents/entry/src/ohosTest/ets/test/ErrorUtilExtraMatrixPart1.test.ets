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
import { ErrorInfo, errorInfo, formatError, pickerErrorHint } from '../../../main/ets/utils/ErrorUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function ErrorUtilExtraMatrixPart1Test(): void {
  describe('ErrorUtilExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0100
     * @tc.name      testPickerHint0001
     * @tc.desc      Verify pickerErrorHint(13900001) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0001 begin');
      await delayTick();
      expect(pickerErrorHint(13900001)).assertEqual('Operation not allowed; user authorization may be missing');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0200
     * @tc.name      testPickerHint0002
     * @tc.desc      Verify pickerErrorHint(13900002) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0002 begin');
      await delayTick();
      expect(pickerErrorHint(13900002)).assertEqual('Target file or directory does not exist');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0300
     * @tc.name      testPickerHint0003
     * @tc.desc      Verify pickerErrorHint(13900012) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0003 begin');
      await delayTick();
      expect(pickerErrorHint(13900012)).assertEqual('Permission denied; check the visibility configuration');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0400
     * @tc.name      testPickerHint0004
     * @tc.desc      Verify pickerErrorHint(13900015) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0004 begin');
      await delayTick();
      expect(pickerErrorHint(13900015)).assertEqual('Target file already exists');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0500
     * @tc.name      testPickerHint0005
     * @tc.desc      Verify pickerErrorHint(13900020) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0005 begin');
      await delayTick();
      expect(pickerErrorHint(13900020)).assertEqual('Invalid parameters; check the save options');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0600
     * @tc.name      testPickerHint0006
     * @tc.desc      Verify pickerErrorHint(13900042) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0006 begin');
      await delayTick();
      expect(pickerErrorHint(13900042)).assertEqual('File service is temporarily unavailable; try again later');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0700
     * @tc.name      testPickerHint0007
     * @tc.desc      Verify pickerErrorHint(0) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0007 begin');
      await delayTick();
      expect(pickerErrorHint(0)).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0800
     * @tc.name      testPickerHint0008
     * @tc.desc      Verify pickerErrorHint(-1) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0008 begin');
      await delayTick();
      expect(pickerErrorHint(-1)).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_0900
     * @tc.name      testPickerHint0009
     * @tc.desc      Verify pickerErrorHint(999) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPickerHint0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0009 begin');
      await delayTick();
      expect(pickerErrorHint(999)).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPickerHint0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1000
     * @tc.name      testErrorInfo0010
     * @tc.desc      Verify ErrorInfo(-1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0010 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(-1, '', 'Falls back to the app sandbox when the picker is unavailable');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('Unknown error');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1100
     * @tc.name      testErrorInfo0011
     * @tc.desc      Verify ErrorInfo(-1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0011 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(-1, 'x', 'Falls back to the app sandbox when the picker is unavailable');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('x');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1200
     * @tc.name      testErrorInfo0012
     * @tc.desc      Verify ErrorInfo(0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0012 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(0, '', 'Falls back to the app sandbox when the picker is unavailable');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('Unknown error');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1300
     * @tc.name      testErrorInfo0013
     * @tc.desc      Verify ErrorInfo(0, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0013 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(0, 'x', 'Falls back to the app sandbox when the picker is unavailable');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('x');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1400
     * @tc.name      testErrorInfo0014
     * @tc.desc      Verify ErrorInfo(1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0014 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(1, '', 'Falls back to the app sandbox when the picker is unavailable');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('[1] Unknown error');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1500
     * @tc.name      testErrorInfo0015
     * @tc.desc      Verify ErrorInfo(1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0015 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(1, 'x', 'Falls back to the app sandbox when the picker is unavailable');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('[1] x');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1600
     * @tc.name      testErrorInfo0016
     * @tc.desc      Verify ErrorInfo(13900001, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0016 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(13900001, '', 'Operation not allowed; user authorization may be missing');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('[13900001] Unknown error');
      expect(info.hint).assertEqual('Operation not allowed; user authorization may be missing');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1700
     * @tc.name      testErrorInfo0017
     * @tc.desc      Verify ErrorInfo(13900001, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfo0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0017 begin');
      await delayTick();
      const info: ErrorInfo = new ErrorInfo(13900001, 'x', 'Operation not allowed; user authorization may be missing');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('[13900001] x');
      expect(info.hint).assertEqual('Operation not allowed; user authorization may be missing');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfo0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1800
     * @tc.name      testErrorInfoFactory0018
     * @tc.desc      Verify errorInfo(0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0018 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(0, '');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_1900
     * @tc.name      testErrorInfoFactory0019
     * @tc.desc      Verify errorInfo(0, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0019 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(0, 'x');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2000
     * @tc.name      testErrorInfoFactory0020
     * @tc.desc      Verify errorInfo(1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0020 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(1, '');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('[1] Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2100
     * @tc.name      testErrorInfoFactory0021
     * @tc.desc      Verify errorInfo(1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0021 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(1, 'x');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('[1] x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2200
     * @tc.name      testErrorInfoFactory0022
     * @tc.desc      Verify errorInfo(13900001, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0022 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(13900001, '');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('[13900001] Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2300
     * @tc.name      testErrorInfoFactory0023
     * @tc.desc      Verify errorInfo(13900001, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0023 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(13900001, 'x');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('[13900001] x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2400
     * @tc.name      testErrorInfoFactory0024
     * @tc.desc      Verify errorInfo(-1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0024 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(-1, '');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2500
     * @tc.name      testErrorInfoFactory0025
     * @tc.desc      Verify errorInfo(-1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testErrorInfoFactory0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0025 begin');
      await delayTick();
      const info: ErrorInfo = errorInfo(-1, 'x');
      expect(info.message).assertEqual('x');
      expect(info.describe()).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorInfoFactory0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2600
     * @tc.name      testFormatError0026
     * @tc.desc      Verify formatError('save', 0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0026 begin');
      await delayTick();
      expect(formatError('save', 0, '')).assertEqual('save failed: Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2700
     * @tc.name      testFormatError0027
     * @tc.desc      Verify formatError('save', 0, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0027 begin');
      await delayTick();
      expect(formatError('save', 0, 'x')).assertEqual('save failed: x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2800
     * @tc.name      testFormatError0028
     * @tc.desc      Verify formatError('save', 1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0028 begin');
      await delayTick();
      expect(formatError('save', 1, '')).assertEqual('save failed (1): Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_2900
     * @tc.name      testFormatError0029
     * @tc.desc      Verify formatError('save', 1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0029 begin');
      await delayTick();
      expect(formatError('save', 1, 'x')).assertEqual('save failed (1): x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3000
     * @tc.name      testFormatError0030
     * @tc.desc      Verify formatError('save', 13900001, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0030 begin');
      await delayTick();
      expect(formatError('save', 13900001, '')).assertEqual('save failed (13900001): Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3100
     * @tc.name      testFormatError0031
     * @tc.desc      Verify formatError('save', 13900001, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0031 begin');
      await delayTick();
      expect(formatError('save', 13900001, 'x')).assertEqual('save failed (13900001): x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3200
     * @tc.name      testFormatError0032
     * @tc.desc      Verify formatError('download', 0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0032 begin');
      await delayTick();
      expect(formatError('download', 0, '')).assertEqual('download failed: Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3300
     * @tc.name      testFormatError0033
     * @tc.desc      Verify formatError('download', 0, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0033 begin');
      await delayTick();
      expect(formatError('download', 0, 'x')).assertEqual('download failed: x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3400
     * @tc.name      testFormatError0034
     * @tc.desc      Verify formatError('download', 1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0034 begin');
      await delayTick();
      expect(formatError('download', 1, '')).assertEqual('download failed (1): Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3500
     * @tc.name      testFormatError0035
     * @tc.desc      Verify formatError('download', 1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0035 begin');
      await delayTick();
      expect(formatError('download', 1, 'x')).assertEqual('download failed (1): x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3600
     * @tc.name      testFormatError0036
     * @tc.desc      Verify formatError('download', 13900001, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0036 begin');
      await delayTick();
      expect(formatError('download', 13900001, '')).assertEqual('download failed (13900001): Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3700
     * @tc.name      testFormatError0037
     * @tc.desc      Verify formatError('download', 13900001, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0037 begin');
      await delayTick();
      expect(formatError('download', 13900001, 'x')).assertEqual('download failed (13900001): x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3800
     * @tc.name      testFormatError0038
     * @tc.desc      Verify formatError('', 0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0038 begin');
      await delayTick();
      expect(formatError('', 0, '')).assertEqual(' failed: Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_3900
     * @tc.name      testFormatError0039
     * @tc.desc      Verify formatError('', 0, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0039 begin');
      await delayTick();
      expect(formatError('', 0, 'x')).assertEqual(' failed: x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_EUEP1_4000
     * @tc.name      testFormatError0040
     * @tc.desc      Verify formatError('', 1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatError0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0040 begin');
      await delayTick();
      expect(formatError('', 1, '')).assertEqual(' failed (1): Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatError0040 end');
    })

  })
}
