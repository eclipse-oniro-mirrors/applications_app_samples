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
import { expect } from '@ohos/hypium';
import { fileUtils } from '@ohos/uploaddownload';
import fs from '@ohos.file.fs';
import { FileSandbox } from '../fixtures/FileSandbox';
import { finishCleanup } from '../fixtures/CleanupFailure';

/**
 * @tc.number EXP_FILES_INIT_001
 * @tc.name EXP_FILES_INIT_001
 * @tc.desc 下载目录初始化与部分已存在状态 — FILES_INIT_001. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('FILES_INIT_001');
    let primaryFailed = true;
    try {
      const result = await fileUtils.initDownloadDir(sandbox.root);
      expect(result).assertUndefined();
      expect(fs.listFileSync(sandbox.root).sort()).assertDeepEquals(['Others', 'Pictures', 'Videos']);
      expect(fs.statSync(sandbox.root + '/Pictures').isDirectory()).assertEqual(true);
      expect(fs.statSync(sandbox.root + '/Videos').isDirectory()).assertEqual(true);
      expect(fs.statSync(sandbox.root + '/Others').isDirectory()).assertEqual(true);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
