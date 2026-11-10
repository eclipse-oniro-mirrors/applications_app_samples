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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  appContext,
  pathExists,
  readTextFile,
  removeDirQuietly,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function dirFor(label: string): string {
  return `${appContext().filesDir}/${uniqueName(`avs_dir_${label}`, '')}`;
}

export default function fileDirectoryMatrixTest() {
  describe('fileDirectoryMatrixTest', () => {
    beforeAll(() => {
      console.info('fileDirectoryMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileDirectoryMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0100
     * @tc.name      testFileDirectory0001
     * @tc.desc      Verify a three-level directory chain is created and each level lists its single child
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0001', 0, () => {
      const root: string = dirFor('chain');
      const middle: string = `${root}/middle`;
      const leaf: string = `${middle}/leaf`;
      try {
        fileIo.mkdirSync(leaf, true);
        expect(fileIo.listFileSync(root).length).assertEqual(1);
        expect(fileIo.listFileSync(middle).length).assertEqual(1);
        expect(fileIo.listFileSync(leaf).length).assertEqual(0);
        expect(fileIo.statSync(leaf).isDirectory()).assertTrue();
      } finally {
        removeDirQuietly(leaf);
        removeDirQuietly(middle);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0200
     * @tc.name      testFileDirectory0002
     * @tc.desc      Verify a file placed in a nested directory appears only in that directory listing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0002', 0, () => {
      const root: string = dirFor('nested_file');
      const child: string = `${root}/child`;
      const file: string = `${child}/payload.txt`;
      try {
        fileIo.mkdirSync(child, true);
        writeTextFile(file, 'nested');
        expect(fileIo.listFileSync(child).length).assertEqual(1);
        expect(fileIo.listFileSync(child)[0]).assertEqual('payload.txt');
        expect(fileIo.listFileSync(root).length).assertEqual(1);
        expect(fileIo.listFileSync(root)[0]).assertEqual('child');
        expect(readTextFile(file, 6)).assertEqual('nested');
      } finally {
        removeQuietly(file);
        removeDirQuietly(child);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0300
     * @tc.name      testFileDirectory0003
     * @tc.desc      Verify renaming a directory keeps its descendants addressable through the new path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0003', 0, () => {
      const source: string = dirFor('rename_src');
      const target: string = dirFor('rename_dst');
      const file: string = `${source}/inner/data.txt`;
      try {
        fileIo.mkdirSync(`${source}/inner`, true);
        writeTextFile(file, 'data');
        fileIo.renameSync(source, target);
        expect(pathExists(source)).assertFalse();
        expect(pathExists(`${target}/inner`)).assertTrue();
        expect(readTextFile(`${target}/inner/data.txt`, 4)).assertEqual('data');
      } finally {
        removeQuietly(`${target}/inner/data.txt`);
        removeDirQuietly(`${target}/inner`);
        removeDirQuietly(target);
        removeDirQuietly(`${source}/inner`);
        removeDirQuietly(source);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0400
     * @tc.name      testFileDirectory0004
     * @tc.desc      Verify recursive removal deletes the whole subtree
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0004', 0, () => {
      const root: string = dirFor('remove_all');
      const nested: string = `${root}/a/b/c`;
      const file: string = `${nested}/file.txt`;
      try {
        fileIo.mkdirSync(nested, true);
        writeTextFile(file, 'removable');
        expect(pathExists(file)).assertTrue();
        fileIo.rmdirSync(root);
        expect(pathExists(root)).assertFalse();
        expect(pathExists(nested)).assertFalse();
        expect(pathExists(file)).assertFalse();
      } finally {
        removeQuietly(file);
        removeDirQuietly(nested);
        removeDirQuietly(`${root}/a/b`);
        removeDirQuietly(`${root}/a`);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0500
     * @tc.name      testFileDirectory0005
     * @tc.desc      Verify ten sibling directories are all visible in the parent listing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0005', 0, () => {
      const root: string = dirFor('siblings');
      const count: number = 10;
      try {
        fileIo.mkdirSync(root);
        for (let i = 0; i < count; i++) {
          fileIo.mkdirSync(`${root}/child_${i}`);
        }
        const names: string[] = fileIo.listFileSync(root);
        expect(names.length).assertEqual(count);
        for (let i = 0; i < count; i++) {
          expect(names.indexOf(`child_${i}`) >= 0).assertTrue();
        }
      } finally {
        for (let i = 0; i < count; i++) {
          removeDirQuietly(`${root}/child_${i}`);
        }
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0600
     * @tc.name      testFileDirectory0006
     * @tc.desc      Verify a directory name containing a space can be created, listed and removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0006', 0, () => {
      const parent: string = dirFor('space_parent');
      const child: string = `${parent}/with space`;
      try {
        fileIo.mkdirSync(child, true);
        const names: string[] = fileIo.listFileSync(parent);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('with space');
      } finally {
        removeDirQuietly(child);
        removeDirQuietly(parent);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0700
     * @tc.name      testFileDirectory0007
     * @tc.desc      Verify a directory name containing CJK characters can be created and listed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0007', 0, () => {
      const parent: string = dirFor('cjk_parent');
      const child: string = `${parent}/音画目录`;
      try {
        fileIo.mkdirSync(child, true);
        expect(fileIo.statSync(child).isDirectory()).assertTrue();
        const names: string[] = fileIo.listFileSync(parent);
        expect(names[0]).assertEqual('音画目录');
      } finally {
        removeDirQuietly(child);
        removeDirQuietly(parent);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0800
     * @tc.name      testFileDirectory0008
     * @tc.desc      Verify listing a parent does not recursively expose grandchildren
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0008', 0, () => {
      const root: string = dirFor('non_recursive');
      const child: string = `${root}/child`;
      const grandChild: string = `${child}/grand`;
      try {
        fileIo.mkdirSync(grandChild, true);
        writeTextFile(`${grandChild}/deep.txt`, 'deep');
        const rootNames: string[] = fileIo.listFileSync(root);
        expect(rootNames.length).assertEqual(1);
        expect(rootNames[0]).assertEqual('child');
        expect(rootNames.indexOf('grand')).assertEqual(-1);
        expect(rootNames.indexOf('deep.txt')).assertEqual(-1);
      } finally {
        removeQuietly(`${grandChild}/deep.txt`);
        removeDirQuietly(grandChild);
        removeDirQuietly(child);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_0900
     * @tc.name      testFileDirectory0009
     * @tc.desc      Verify a deep path can hold and return a payload through read after write
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0009', 0, () => {
      const root: string = dirFor('deep_write');
      const deep: string = `${root}/l1/l2/l3/l4`;
      const file: string = `${deep}/payload.txt`;
      const payload: string = 'deep-payload';
      try {
        fileIo.mkdirSync(deep, true);
        expect(writeTextFile(file, payload)).assertEqual(payload.length);
        expect(fileIo.statSync(file).size).assertEqual(payload.length);
        expect(readTextFile(file, payload.length)).assertEqual(payload);
        expect(fileIo.listFileSync(deep).length).assertEqual(1);
      } finally {
        removeQuietly(file);
        removeDirQuietly(deep);
        removeDirQuietly(`${root}/l1/l2/l3`);
        removeDirQuietly(`${root}/l1/l2`);
        removeDirQuietly(`${root}/l1`);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_1000
     * @tc.name      testFileDirectory0010
     * @tc.desc      Verify two sibling directories with different names hold independent content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0010', 0, () => {
      const root: string = dirFor('independent');
      const first: string = `${root}/first`;
      const second: string = `${root}/second`;
      try {
        fileIo.mkdirSync(first, true);
        fileIo.mkdirSync(second, true);
        writeTextFile(`${first}/data.txt`, 'first-data');
        writeTextFile(`${second}/data.txt`, 'second-data');
        expect(readTextFile(`${first}/data.txt`, 10)).assertEqual('first-data');
        expect(readTextFile(`${second}/data.txt`, 11)).assertEqual('second-data');
        expect(fileIo.listFileSync(first).length).assertEqual(1);
        expect(fileIo.listFileSync(second).length).assertEqual(1);
      } finally {
        removeQuietly(`${first}/data.txt`);
        removeQuietly(`${second}/data.txt`);
        removeDirQuietly(first);
        removeDirQuietly(second);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_1100
     * @tc.name      testFileDirectory0011
     * @tc.desc      Verify removing one sibling directory leaves the other intact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0011', 0, () => {
      const root: string = dirFor('sibling_remove');
      const keep: string = `${root}/keep`;
      const drop: string = `${root}/drop`;
      try {
        fileIo.mkdirSync(keep, true);
        fileIo.mkdirSync(drop, true);
        writeTextFile(`${keep}/k.txt`, 'keep');
        writeTextFile(`${drop}/d.txt`, 'drop');
        fileIo.rmdirSync(drop);
        expect(pathExists(drop)).assertFalse();
        expect(pathExists(keep)).assertTrue();
        expect(readTextFile(`${keep}/k.txt`, 4)).assertEqual('keep');
        expect(fileIo.listFileSync(root).length).assertEqual(1);
      } finally {
        removeQuietly(`${keep}/k.txt`);
        removeQuietly(`${drop}/d.txt`);
        removeDirQuietly(keep);
        removeDirQuietly(drop);
        removeDirQuietly(root);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_DIRECTORY_1200
     * @tc.name      testFileDirectory0012
     * @tc.desc      Verify the files directory itself is listable and non-empty after creating an entry
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileDirectory0012', 0, () => {
      const name: string = uniqueName('avs_dir_parent_visible', '');
      const dir: string = `${appContext().filesDir}/${name}`;
      try {
        fileIo.mkdirSync(dir);
        const names: string[] = fileIo.listFileSync(appContext().filesDir);
        expect(names.indexOf(name) >= 0).assertTrue();
        expect(fileIo.statSync(dir).isDirectory()).assertTrue();
      } finally {
        removeDirQuietly(dir);
      }
      expect(pathExists(dir)).assertFalse();
    })
  });
}
