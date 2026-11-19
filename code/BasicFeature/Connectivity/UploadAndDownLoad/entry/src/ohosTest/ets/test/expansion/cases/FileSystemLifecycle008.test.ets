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
 * @tc.number EXP_V2_FS_008
 * @tc.name EXP_V2_FS_008
 * @tc.desc Videos/clip.part.mp4; 17-byte copy, cache hit, clear/recopy recovery and missing-source hit
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sandbox = new FileSandbox('V2_FS_008');
    let primaryFailed = true;
    try {
      sandbox.mkdir('download');
      const downloadDir = sandbox.root + '/download';
      const albums = await fileUtils.listFolders(downloadDir);
      expect(albums).assertDeepEquals(['Pictures', 'Videos', 'Others']);
      expect(fs.listFileSync(downloadDir).sort()).assertDeepEquals(['Others', 'Pictures', 'Videos']);
      sandbox.write('download/Videos/clip.part.mp4', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]);
      sandbox.write('download/Videos/retained.txt', [44, 55]);
      const firstList = await fileUtils.listFiles(downloadDir, 'Videos');
      expect(firstList.sort()).assertDeepEquals(['clip.part.mp4', 'retained.txt']);
      firstList.splice(0, firstList.length);
      const isolatedList = await fileUtils.listFiles(downloadDir, 'Videos');
      expect(isolatedList.sort()).assertDeepEquals(['clip.part.mp4', 'retained.txt']);
      sandbox.mkdir('cache');
      const cacheDir = sandbox.root + '/cache';
      const uri = downloadDir + '/Videos/clip.part.mp4';
      const media = new MediaUtils();
      expect(fs.accessSync(cacheDir + '/clip.part.mp4')).assertEqual(false);
      const firstPath = await media.copyFileToCache(cacheDir, uri);
      expect(firstPath).assertEqual(cacheDir + '/clip.part.mp4');
      expect(sandbox.read('cache/clip.part.mp4')).assertDeepEquals([
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16
      ]);
      expect(sandbox.read('download/Videos/clip.part.mp4')).assertDeepEquals([
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16
      ]);
      expect(sandbox.read('download/Videos/retained.txt')).assertDeepEquals([44, 55]);
      sandbox.write('download/Videos/clip.part.mp4', [7, 8, 9]);
      const hitPath = await media.copyFileToCache(cacheDir, uri);
      expect(hitPath).assertEqual(cacheDir + '/clip.part.mp4');
      expect(sandbox.read('cache/clip.part.mp4')).assertDeepEquals([
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16
      ]);
      expect(sandbox.read('download/Videos/clip.part.mp4')).assertDeepEquals([7, 8, 9]);
      const clearedCache = await fileUtils.clearFolder(sandbox.root, 'cache');
      expect(clearedCache).assertUndefined();
      expect(fs.listFileSync(cacheDir)).assertDeepEquals([]);
      const recoveredPath = await media.copyFileToCache(cacheDir, uri);
      expect(recoveredPath).assertEqual(cacheDir + '/clip.part.mp4');
      expect(sandbox.read('cache/clip.part.mp4')).assertDeepEquals([7, 8, 9]);
      const clearedSource = await fileUtils.clearFolder(downloadDir, 'Videos');
      expect(clearedSource).assertUndefined();
      const emptyList = await fileUtils.listFiles(downloadDir, 'Videos');
      expect(emptyList).assertDeepEquals([]);
      expect(fs.accessSync(uri)).assertEqual(false);
      const retainedHit = await media.copyFileToCache(cacheDir, uri);
      expect(retainedHit).assertEqual(cacheDir + '/clip.part.mp4');
      expect(sandbox.read('cache/clip.part.mp4')).assertDeepEquals([7, 8, 9]);
      expect(fs.listFileSync(cacheDir)).assertDeepEquals(['clip.part.mp4']);
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
