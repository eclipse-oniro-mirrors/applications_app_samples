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
 * @tc.number EXP_FILES_LIST_003
 * @tc.name EXP_FILES_LIST_003
 * @tc.desc 空单多文件、Unicode和缺失目录 — FILES_LIST_003. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('FILES_LIST_003');
    let primaryFailed = true;
    try {
      sandbox.mkdir('Videos');
      sandbox.write('Videos/a.mp4', [1, 2, 3]);
      sandbox.write('Videos/b.mp4', [1, 2, 3]);
      sandbox.write('Videos/c.txt', [1, 2, 3]);
      const result = await fileUtils.listFiles(sandbox.root, 'Videos');
      expect(result.sort()).assertDeepEquals(['a.mp4', 'b.mp4', 'c.txt']);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
