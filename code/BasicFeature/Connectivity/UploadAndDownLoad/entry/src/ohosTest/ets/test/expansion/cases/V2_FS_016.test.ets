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
import { FileSandbox } from '../fixtures/FileSandbox';
import { BusinessError } from '@ohos.base';
import { finishCleanup } from '../fixtures/CleanupFailure';

/**
 * @tc.number EXP_V2_FS_016
 * @tc.name EXP_V2_FS_016
 * @tc.desc copy target parent absent; name=中文.png; trailingSlash=True; exact failure path, recovery, cache-only hit, open rejection
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('V2_FS_016');
    let primaryFailed = true;
    try {
      sandbox.mkdir('source');
      sandbox.write('source/中文.png', [0, 9, 128, 255]);
      const uri = sandbox.root + '/source/中文.png';
      const missingDir = sandbox.root + '/missing-cache';
      expect(fs.accessSync(missingDir)).assertEqual(false);
      const media = new MediaUtils();
      const targetDir = missingDir + '/';
      const failedCopyPath = await media.copyFileToCache(targetDir, uri);
      expect(failedCopyPath).assertEqual(missingDir + '//中文.png');
      expect(fs.accessSync(failedCopyPath)).assertEqual(false);
      expect(fs.accessSync(missingDir)).assertEqual(false);
      expect(sandbox.read('source/中文.png')).assertDeepEquals([0, 9, 128, 255]);
      expect(fs.listFileSync(sandbox.root)).assertDeepEquals(['source']);
      sandbox.mkdir('missing-cache');
      const recoveredPath = await media.copyFileToCache(targetDir, uri);
      expect(recoveredPath).assertEqual(missingDir + '//中文.png');
      expect(sandbox.read('missing-cache/中文.png')).assertDeepEquals([0, 9, 128, 255]);
      expect(sandbox.read('source/中文.png')).assertDeepEquals([0, 9, 128, 255]);
      expect(fs.listFileSync(missingDir)).assertDeepEquals(['中文.png']);
      fs.unlinkSync(uri);
      expect(fs.accessSync(uri)).assertEqual(false);
      const hitAfterSourceRemoval = await media.copyFileToCache(targetDir, uri);
      expect(hitAfterSourceRemoval).assertEqual(missingDir + '//中文.png');
      expect(sandbox.read('missing-cache/中文.png')).assertDeepEquals([0, 9, 128, 255]);
      fs.unlinkSync(recoveredPath);
      let rejected = false;
      let code = 0;
      try {
        await media.copyFileToCache(targetDir, uri);
      } catch (error) {
        rejected = true;
        code = (error as BusinessError).code;
      }
      expect(rejected).assertEqual(true);
      expect(code).assertEqual(13900002);
      expect(fs.accessSync(recoveredPath)).assertEqual(false);
      expect(fs.listFileSync(missingDir)).assertDeepEquals([]);
      expect(fs.listFileSync(sandbox.root + '/source')).assertDeepEquals([]);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
