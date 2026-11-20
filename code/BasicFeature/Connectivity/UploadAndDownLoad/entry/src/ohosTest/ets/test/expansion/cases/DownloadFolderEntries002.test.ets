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
 * @tc.number EXP_FILES_FOLDERS_002
 * @tc.name EXP_FILES_FOLDERS_002
 * @tc.desc 下载相册目录列表及初始化副作用 — FILES_FOLDERS_002. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('FILES_FOLDERS_002');
    let primaryFailed = true;
    try {
      sandbox.mkdir('Pictures');
      const result = await fileUtils.listFolders(sandbox.root);
      expect(result).assertDeepEquals(['Pictures', 'Videos', 'Others']);
      expect(fs.listFileSync(sandbox.root).sort()).assertDeepEquals(['Pictures']);
      expect(fs.statSync(sandbox.root + '/Pictures').isDirectory()).assertEqual(true);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
