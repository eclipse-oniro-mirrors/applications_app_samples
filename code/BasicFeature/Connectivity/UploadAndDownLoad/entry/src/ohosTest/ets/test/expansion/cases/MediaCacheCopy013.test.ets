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
 * @tc.number EXP_MEDIA_CACHE_013
 * @tc.name EXP_MEDIA_CACHE_013
 * @tc.desc 上传缓存路径、命中、字节复制及失败 — MEDIA_CACHE_013. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('MEDIA_CACHE_013');
    let primaryFailed = true;
    try {
      sandbox.mkdir('cache');
      sandbox.mkdir('source');
      const cacheDir = sandbox.root + '/cache';
      const media = new MediaUtils();
      const uri = sandbox.root + '/absent/missing.jpg';
      expect(fs.accessSync(uri)).assertEqual(false);
      let rejected = false;
      let errorCode = 0;
      try {
        await media.copyFileToCache(cacheDir, uri);
      } catch (error) {
        rejected = true;
        errorCode = (error as BusinessError).code;
      }
      expect(rejected).assertEqual(true);
      // SDK fs.open documents 13900002: No such file or directory.
      expect(errorCode).assertEqual(13900002);
      expect(fs.accessSync(cacheDir + '/missing.jpg')).assertEqual(false);
      expect(fs.listFileSync(cacheDir)).assertDeepEquals([]);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
