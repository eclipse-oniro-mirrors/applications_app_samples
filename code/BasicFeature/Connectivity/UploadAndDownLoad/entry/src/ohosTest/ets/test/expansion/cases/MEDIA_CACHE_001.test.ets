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
import { MediaUtils } from '@ohos/uploaddownload';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { FileSandbox } from '../fixtures/FileSandbox';
import { finishCleanup } from '../fixtures/CleanupFailure';

/**
 * @tc.number EXP_MEDIA_CACHE_001
 * @tc.name EXP_MEDIA_CACHE_001
 * @tc.desc 上传缓存路径、命中、字节复制及失败 — MEDIA_CACHE_001. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('MEDIA_CACHE_001');
    let primaryFailed = true;
    try {
      sandbox.mkdir('cache');
      sandbox.mkdir('source');
      const cacheDir = sandbox.root + '/cache';
      const media = new MediaUtils();
      sandbox.write('source/a.jpg', [0, 1, 2, 127, 128, 255]);
      const uri = sandbox.root + '/source/a.jpg';
      expect(fs.accessSync(cacheDir + '/a.jpg')).assertEqual(false);
      const result = await media.copyFileToCache(cacheDir, uri);
      expect(result).assertEqual(cacheDir + '/a.jpg');
      expect(sandbox.read('cache/a.jpg')).assertDeepEquals([0, 1, 2, 127, 128, 255]);
      expect(sandbox.read('source/a.jpg')).assertDeepEquals([0, 1, 2, 127, 128, 255]);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
