/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { paceTurn } from '../Shared/TestPace';
import {
  appContext,
  encodeText,
  pathInFiles,
  readTextFile,
  removeDirQuietly,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_stat_${label}`, '.txt'));
}

export default function fileStatMatrixTest() {
  describe('fileStatMatrixTest', () => {
    beforeAll(() => {
      console.info('fileStatMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileStatMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0100
     * @tc.name      testFileStat0001
     * @tc.desc      Verify stat reports a regular file for a newly written one-byte file
     */
    it('testFileStat0001', 0, () => {
      const path: string = targetFor('one');
      try {
        writeTextFile(path, 'a');
        const stat: fileIo.Stat = fileIo.statSync(path);
        expect(stat.isFile()).assertTrue();
        expect(stat.isDirectory()).assertFalse();
        expect(stat.size).assertEqual(1);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0200
     * @tc.name      testFileStat0002
     * @tc.desc      Verify the stat size matches the payload for 64 and 1024 byte files
     */
    it('testFileStat0002', 0, () => {
      const path: string = targetFor('sizes');
      try {
        writeTextFile(path, repeatPayload(64, 's'));
        expect(fileIo.statSync(path).size).assertEqual(64);
        writeTextFile(path, repeatPayload(1024, 's'));
        expect(fileIo.statSync(path).size).assertEqual(1024);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0300
     * @tc.name      testFileStat0003
     * @tc.desc      Verify truncation is reflected in the next stat call
     */
    it('testFileStat0003', 0, () => {
      const path: string = targetFor('truncate');
      try {
        writeTextFile(path, repeatPayload(512, 't'));
        fileIo.truncateSync(path, 128);
        expect(fileIo.statSync(path).size).assertEqual(128);
        fileIo.truncateSync(path, 0);
        expect(fileIo.statSync(path).size).assertEqual(0);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0400
     * @tc.name      testFileStat0004
     * @tc.desc      Verify appending updates the stat size to the sum of both chunks
     */
    it('testFileStat0004', 0, () => {
      const path: string = targetFor('append');
      try {
        writeTextFile(path, 'head');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        expect(fileIo.writeSync(file.fd, encodeText('tail'))).assertEqual(4);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('headtail');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0500
     * @tc.name      testFileStat0005
     * @tc.desc      Verify stat distinguishes a directory node from a regular file
     */
    it('testFileStat0005', 0, () => {
      const dir: string = `${appContext().filesDir}/${uniqueName('avs_stat_dir', '')}`;
      const file: string = targetFor('mixed');
      try {
        fileIo.mkdirSync(dir);
        writeTextFile(file, 'mixed');
        expect(fileIo.statSync(dir).isDirectory()).assertTrue();
        expect(fileIo.statSync(dir).isFile()).assertFalse();
        expect(fileIo.statSync(file).isFile()).assertTrue();
        expect(fileIo.statSync(file).isDirectory()).assertFalse();
      } finally {
        removeDirQuietly(dir);
        removeQuietly(file);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0600
     * @tc.name      testFileStat0006
     * @tc.desc      Verify stat on a missing path fails with the no-such-file code
     */
    it('testFileStat0006', 0, () => {
      const missing: string = targetFor('missing');
      let code: number = -1;
      try {
        fileIo.statSync(missing);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      expect(code).assertEqual(13900002);
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0700
     * @tc.name      testFileStat0007
     * @tc.desc      Verify an empty file reports size zero and remains a regular file
     */
    it('testFileStat0007', 0, () => {
      const path: string = targetFor('empty');
      try {
        writeTextFile(path, '');
        const stat: fileIo.Stat = fileIo.statSync(path);
        expect(stat.size).assertEqual(0);
        expect(stat.isFile()).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0800
     * @tc.name      testFileStat0008
     * @tc.desc      Verify repeated stat calls return the same size without mutation
     */
    it('testFileStat0008', 0, () => {
      const path: string = targetFor('stable');
      try {
        writeTextFile(path, repeatPayload(300, 'stable'));
        for (let i = 0; i < 50; i++) {
          expect(fileIo.statSync(path).size).assertEqual(300);
        }
        expect(readTextFile(path, 300).length).assertEqual(300);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_STAT_0900
     * @tc.name      testFileStat0009
     * @tc.desc      Verify stat size tracks a sequence of growing writes
     */
    it('testFileStat0009', 0, () => {
      const path: string = targetFor('growing');
      try {
        const sizes: number[] = [1, 8, 64, 256, 1024];
        for (let i = 0; i < sizes.length; i++) {
          writeTextFile(path, repeatPayload(sizes[i], 'g'));
          expect(fileIo.statSync(path).size).assertEqual(sizes[i]);
        }
      } finally {
        removeQuietly(path);
      }
    })
  });
}
