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
import { hilog } from '@kit.PerformanceAnalysisKit';
import StorageModel from '../../../main/ets/model/StorageModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockStorageSingletonTest() {
  describe('FlipClockStorageSingletonTest', () => {

    /**
     * @tc.name   testFlipClockStorageSingleton001
     * @tc.number SUB_FLIP_CLOCK_STORAGE_001
     * @tc.desc   Verify StorageModel singleton identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockStorageSingleton001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton001 begin');
      const first: StorageModel = StorageModel.getInstance();
        const second: StorageModel = StorageModel.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(first === second).assertTrue();');
        expect(first === second).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(first !== null).assertTrue();');
        expect(first !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton001 end');
    })

    /**
     * @tc.name   testFlipClockStorageSingleton002
     * @tc.number SUB_FLIP_CLOCK_STORAGE_002
     * @tc.desc   Verify StorageModel method set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockStorageSingleton002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton002 begin');
      const model: StorageModel = StorageModel.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.getFromStorage === \'function\').assertTrue();');
        expect(typeof model.getFromStorage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.getStorage === \'function\').assertTrue();');
        expect(typeof model.getStorage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.putStorageValue === \'function\').assertTrue();');
        expect(typeof model.putStorageValue === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton002 end');
    })

    /**
     * @tc.name   testFlipClockStorageSingleton003
     * @tc.number SUB_FLIP_CLOCK_STORAGE_003
     * @tc.desc   Verify storage delete method exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockStorageSingleton003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton003 begin');
      const model: StorageModel = StorageModel.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.deleteSync === \'function\').assertTrue();');
        expect(typeof model.deleteSync === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.getStorageValue === \'function\').assertTrue();');
        expect(typeof model.getStorageValue === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.putTotalStorageValue === \'function\').assertTrue();');
        expect(typeof model.putTotalStorageValue === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton003 end');
    })

    /**
     * @tc.name   testFlipClockStorageSingleton004
     * @tc.number SUB_FLIP_CLOCK_STORAGE_004
     * @tc.desc   Verify singleton survives repeated reads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockStorageSingleton004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton004 begin');
      const a: StorageModel = StorageModel.getInstance();
        const b: StorageModel = StorageModel.getInstance();
        const c: StorageModel = StorageModel.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(b === c).assertTrue();');
        expect(b === c).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockStorageSingleton004 end');
    })
  })
}
