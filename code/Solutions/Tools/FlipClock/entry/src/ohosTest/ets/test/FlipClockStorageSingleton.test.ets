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
import StorageModel from '../../../main/ets/model/StorageModel';

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
      const first: StorageModel = StorageModel.getInstance(); const second: StorageModel = StorageModel.getInstance(); expect(first === second).assertTrue(); expect(first !== null).assertTrue();
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
      const model: StorageModel = StorageModel.getInstance(); expect(typeof model.getFromStorage === 'function').assertTrue(); expect(typeof model.getStorage === 'function').assertTrue(); expect(typeof model.putStorageValue === 'function').assertTrue();
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
      const model: StorageModel = StorageModel.getInstance(); expect(typeof model.deleteSync === 'function').assertTrue(); expect(typeof model.getStorageValue === 'function').assertTrue(); expect(typeof model.putTotalStorageValue === 'function').assertTrue();
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
      const a: StorageModel = StorageModel.getInstance(); const b: StorageModel = StorageModel.getInstance(); const c: StorageModel = StorageModel.getInstance(); expect(a === b).assertTrue(); expect(b === c).assertTrue();
    })
  })
}
