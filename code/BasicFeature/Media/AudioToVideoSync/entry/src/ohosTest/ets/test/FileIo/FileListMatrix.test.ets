/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  appContext,
  pathInFiles,
  removeDirQuietly,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';
import { hilog } from '@kit.PerformanceAnalysisKit';

function dirFor(label: string): string {
  return `${appContext().filesDir}/${uniqueName(`avs_list_${label}`, '')}`;
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_FileIo_FileListMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileListMatrixTest() {
  describe('fileListMatrixTest', () => {
    beforeAll(() => {
      console.info('fileListMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileListMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0100
     * @tc.name      testFileList0001
     * @tc.desc      Verify a new directory lists no entries
     */
    it('testFileList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0001');
      const dir: string = dirFor('empty');
      try {
        fileIo.mkdirSync(dir);
        expect(fileIo.listFileSync(dir).length).assertEqual(0);
      } finally {
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0001');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0200
     * @tc.name      testFileList0002
     * @tc.desc      Verify one created file appears exactly once in the listing
     */
    it('testFileList0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0002');
      const dir: string = dirFor('one');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(`${dir}/only.txt`, 'only');
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('only.txt');
      } finally {
        removeQuietly(`${dir}/only.txt`);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0002');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0300
     * @tc.name      testFileList0003
     * @tc.desc      Verify five created files are all visible in the listing
     */
    it('testFileList0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0003');
      const dir: string = dirFor('five');
      try {
        fileIo.mkdirSync(dir);
        for (let i = 0; i < 5; i++) {
          writeTextFile(`${dir}/f${i}.txt`, `${i}`);
        }
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(names.indexOf(`f${i}.txt`) >= 0).assertTrue();
        }
      } finally {
        for (let i = 0; i < 5; i++) {
          removeQuietly(`${dir}/f${i}.txt`);
        }
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0003');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0400
     * @tc.name      testFileList0004
     * @tc.desc      Verify removing one file reduces the listing count by one
     */
    it('testFileList0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0004');
      const dir: string = dirFor('remove');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(`${dir}/a.txt`, 'a');
        writeTextFile(`${dir}/b.txt`, 'b');
        expect(fileIo.listFileSync(dir).length).assertEqual(2);
        fileIo.unlinkSync(`${dir}/a.txt`);
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('b.txt');
      } finally {
        removeQuietly(`${dir}/a.txt`);
        removeQuietly(`${dir}/b.txt`);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0004');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0500
     * @tc.name      testFileList0005
     * @tc.desc      Verify a hidden dot file is included in the directory listing
     */
    it('testFileList0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0005');
      const dir: string = dirFor('hidden');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(`${dir}/.hidden`, 'h');
        writeTextFile(`${dir}/visible.txt`, 'v');
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(2);
        expect(names.indexOf('.hidden') >= 0).assertTrue();
        expect(names.indexOf('visible.txt') >= 0).assertTrue();
      } finally {
        removeQuietly(`${dir}/.hidden`);
        removeQuietly(`${dir}/visible.txt`);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0005');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0600
     * @tc.name      testFileList0006
     * @tc.desc      Verify a child directory is listed by name but its files are not
     */
    it('testFileList0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0006');
      const dir: string = dirFor('child');
      const child: string = `${dir}/child`;
      try {
        fileIo.mkdirSync(child, true);
        writeTextFile(`${child}/inner.txt`, 'i');
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(1);
        expect(names[0]).assertEqual('child');
        expect(names.indexOf('inner.txt')).assertEqual(-1);
      } finally {
        removeQuietly(`${child}/inner.txt`);
        removeDirQuietly(child);
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0006');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0700
     * @tc.name      testFileList0007
     * @tc.desc      Verify listing a regular file as a directory fails
     */
    it('testFileList0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0007');
      const file: string = pathInFiles(uniqueName('avs_list_file', '.txt'));
      try {
        writeTextFile(file, 'x');
        let failed: boolean = false;
        try {
          fileIo.listFileSync(file);
        } catch (error) {
          failed = true;
        }
        expect(failed).assertTrue();
      } finally {
        removeQuietly(file);
      }
    
      logEnd('testFileList0007');
    })

    /**
     * @tc.number    SUB_AVS_FILE_LIST_0800
     * @tc.name      testFileList0008
     * @tc.desc      Verify twenty files are listed with the exact expected count
     */
    it('testFileList0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileList0008');
      const dir: string = dirFor('twenty');
      const count: number = 20;
      try {
        fileIo.mkdirSync(dir);
        for (let i = 0; i < count; i++) {
          writeTextFile(`${dir}/item_${i}.txt`, `${i}`);
        }
        const names: string[] = fileIo.listFileSync(dir);
        expect(names.length).assertEqual(count);
        expect(names.indexOf('item_0.txt') >= 0).assertTrue();
        expect(names.indexOf('item_19.txt') >= 0).assertTrue();
      } finally {
        for (let i = 0; i < count; i++) {
          removeQuietly(`${dir}/item_${i}.txt`);
        }
        removeDirQuietly(dir);
      }
    
      logEnd('testFileList0008');
    })
  });
}
