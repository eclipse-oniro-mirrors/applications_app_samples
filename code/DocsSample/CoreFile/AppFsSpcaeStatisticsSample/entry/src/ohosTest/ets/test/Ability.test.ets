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

import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { logCase, logAssertion, yieldTestLoop } from './StorageTestSupport';

export default function abilityTest(): void {
  describe('AbilityRealSdk', () => {
    beforeEach(yieldTestLoop);
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_CONTEXT_0100
     * @tc.name AppFsSpace_Context_0001
     * @tc.desc Verify the application context supplies distinct absolute files and cache directories.
     */
    it('AppFsSpace_Context_0001', 0, (): void => {
      logCase('AppFsSpace_Context_0001', 'begin');
      try {
        const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
        const filesAbsolute: boolean = context.filesDir.startsWith('/');
        const cacheAbsolute: boolean = context.cacheDir.startsWith('/');
        const directoriesDistinct: boolean = context.filesDir !== context.cacheDir;
        logAssertion('AppFsSpace_Context_0001', 'filesDir is absolute', filesAbsolute, true);
        expect(filesAbsolute).assertEqual(true);
        logAssertion('AppFsSpace_Context_0001', 'cacheDir is absolute', cacheAbsolute, true);
        expect(cacheAbsolute).assertEqual(true);
        logAssertion('AppFsSpace_Context_0001', 'filesDir differs from cacheDir', directoriesDistinct, true);
        expect(directoriesDistinct).assertEqual(true);
      } finally {
        logCase('AppFsSpace_Context_0001', 'end');
      }
    });
  });
}
