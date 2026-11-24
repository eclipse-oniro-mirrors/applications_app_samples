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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect } from '@ohos/hypium';
import { calculateStorageUsage, formatStorageSize, StorageUsage } from '../main/ets/model/StorageQuery';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StorageLocal]';

export default function localUnitTest(): void {
  describe('StorageLocalLogic', () => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_LOCAL_0100
     * @tc.name AppFsSpace_Local_0001
     * @tc.desc Verify 4096 total bytes and 1024 free bytes produce 3072 used bytes and 75 percent usage.
     */
    it('AppFsSpace_Local_0001', 0, (): void => {
      hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0001 begin');
      try {
        const usage: StorageUsage = calculateStorageUsage(4096, 1024);
        hilog.info(DOMAIN, TAG, 'total=4096 free=1024 used=%{public}d expected=3072', usage.usedBytes);
        expect(usage.usedBytes).assertEqual(3072);
        hilog.info(DOMAIN, TAG, 'total=4096 free=1024 percent=%{public}d expected=75', usage.usedPercent);
        expect(usage.usedPercent).assertEqual(75);
      } finally {
        hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0001 end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_LOCAL_0200
     * @tc.name AppFsSpace_Local_0002
     * @tc.desc Verify an empty storage snapshot has zero used bytes and zero usage percentage.
     */
    it('AppFsSpace_Local_0002', 0, (): void => {
      hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0002 begin');
      try {
        const usage: StorageUsage = calculateStorageUsage(0, 0);
        hilog.info(DOMAIN, TAG, 'total=0 free=0 used=%{public}d expected=0', usage.usedBytes);
        expect(usage.usedBytes).assertEqual(0);
        hilog.info(DOMAIN, TAG, 'total=0 free=0 percent=%{public}d expected=0', usage.usedPercent);
        expect(usage.usedPercent).assertEqual(0);
      } finally {
        hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0002 end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_LOCAL_0300
     * @tc.name AppFsSpace_Local_0003
     * @tc.desc Verify 1536 bytes use the KiB unit with two fractional digits.
     */
    it('AppFsSpace_Local_0003', 0, (): void => {
      hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0003 begin');
      try {
        const formatted: string = formatStorageSize(1536, 2);
        hilog.info(DOMAIN, TAG, 'bytes=1536 precision=2 actual=%{public}s expected=1.50 KiB', formatted);
        expect(formatted).assertEqual('1.50 KiB');
      } finally {
        hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0003 end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_LOCAL_0400
     * @tc.name AppFsSpace_Local_0004
     * @tc.desc Verify free bytes exceeding total bytes raise the documented validation error.
     */
    it('AppFsSpace_Local_0004', 0, (): void => {
      hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0004 begin');
      try {
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          calculateStorageUsage(10, 11);
        } catch (error) {
          errorName = (error as Error).name;
          errorMessage = (error as Error).message;
        }
        hilog.info(DOMAIN, TAG, 'total=10 free=11 error=%{public}s expected=InvalidStorageValueError', errorName);
        expect(errorName).assertEqual('InvalidStorageValueError');
        hilog.info(DOMAIN, TAG, 'total=10 free=11 message=%{public}s expected=Free size must not exceed total size',
          errorMessage);
        expect(errorMessage).assertEqual('Free size must not exceed total size');
      } finally {
        hilog.info(DOMAIN, TAG, 'AppFsSpace_Local_0004 end');
      }
    });
  });
}
