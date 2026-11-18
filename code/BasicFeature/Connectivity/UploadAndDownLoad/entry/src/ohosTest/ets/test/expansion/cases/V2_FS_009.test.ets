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
import { MediaUtils } from '@ohos/uploaddownload';
import fs from '@ohos.file.fs';
import { FileSandbox } from '../fixtures/FileSandbox';
import { finishCleanup } from '../fixtures/CleanupFailure';

/**
 * @tc.number EXP_V2_FS_009
 * @tc.name EXP_V2_FS_009
 * @tc.desc Others/with space.dat; 0-byte copy, cache hit, clear/recopy recovery and missing-source hit
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('V2_FS_009');
    let primaryFailed = true;
    try {
      sandbox.mkdir('download');
      const downloadDir = sandbox.root + '/download';
      const albums = await fileUtils.listFolders(downloadDir);
      expect(albums).assertDeepEquals(['Pictures', 'Videos', 'Others']);
      expect(fs.listFileSync(downloadDir).sort()).assertDeepEquals(['Others', 'Pictures', 'Videos']);
      sandbox.write('download/Others/with space.dat', []);
      sandbox.write('download/Others/retained.txt', [44, 55]);
      const firstList = await fileUtils.listFiles(downloadDir, 'Others');
      expect(firstList.sort()).assertDeepEquals(['retained.txt', 'with space.dat']);
      firstList.splice(0, firstList.length);
      const isolatedList = await fileUtils.listFiles(downloadDir, 'Others');
      expect(isolatedList.sort()).assertDeepEquals(['retained.txt', 'with space.dat']);
      sandbox.mkdir('cache');
      const cacheDir = sandbox.root + '/cache';
      const uri = downloadDir + '/Others/with space.dat';
      const media = new MediaUtils();
      expect(fs.accessSync(cacheDir + '/with space.dat')).assertEqual(false);
      const firstPath = await media.copyFileToCache(cacheDir, uri);
      expect(firstPath).assertEqual(cacheDir + '/with space.dat');
      expect(sandbox.read('cache/with space.dat')).assertDeepEquals([]);
      expect(sandbox.read('download/Others/with space.dat')).assertDeepEquals([]);
      expect(sandbox.read('download/Others/retained.txt')).assertDeepEquals([44, 55]);
      sandbox.write('download/Others/with space.dat', [7, 8, 9]);
      const hitPath = await media.copyFileToCache(cacheDir, uri);
      expect(hitPath).assertEqual(cacheDir + '/with space.dat');
      expect(sandbox.read('cache/with space.dat')).assertDeepEquals([]);
      expect(sandbox.read('download/Others/with space.dat')).assertDeepEquals([7, 8, 9]);
      const clearedCache = await fileUtils.clearFolder(sandbox.root, 'cache');
      expect(clearedCache).assertUndefined();
      expect(fs.listFileSync(cacheDir)).assertDeepEquals([]);
      const recoveredPath = await media.copyFileToCache(cacheDir, uri);
      expect(recoveredPath).assertEqual(cacheDir + '/with space.dat');
      expect(sandbox.read('cache/with space.dat')).assertDeepEquals([7, 8, 9]);
      const clearedSource = await fileUtils.clearFolder(downloadDir, 'Others');
      expect(clearedSource).assertUndefined();
      const emptyList = await fileUtils.listFiles(downloadDir, 'Others');
      expect(emptyList).assertDeepEquals([]);
      expect(fs.accessSync(uri)).assertEqual(false);
      const retainedHit = await media.copyFileToCache(cacheDir, uri);
      expect(retainedHit).assertEqual(cacheDir + '/with space.dat');
      expect(sandbox.read('cache/with space.dat')).assertDeepEquals([7, 8, 9]);
      expect(fs.listFileSync(cacheDir)).assertDeepEquals(['with space.dat']);
      expect(fs.statSync(downloadDir + '/Pictures').isDirectory()).assertEqual(true);
      expect(fs.listFileSync(downloadDir + '/Pictures')).assertDeepEquals([]);
      expect(fs.statSync(downloadDir + '/Videos').isDirectory()).assertEqual(true);
      expect(fs.listFileSync(downloadDir + '/Videos')).assertDeepEquals([]);
      expect(fs.statSync(downloadDir + '/Others').isDirectory()).assertEqual(true);
      expect(fs.listFileSync(downloadDir + '/Others')).assertDeepEquals([]);
      const replayAlbums = await fileUtils.listFolders(downloadDir);
      expect(replayAlbums).assertDeepEquals(['Pictures', 'Videos', 'Others']);
      expect(fs.listFileSync(downloadDir).sort()).assertDeepEquals(['Others', 'Pictures', 'Videos']);
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        sandbox.dispose();
      });
    }
  };

export default runExpansionCase;
