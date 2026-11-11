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
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOOPS: number = 50;

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_loop_${label}`, '.txt'));
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Stability_FileIoLoopMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileIoLoopMatrixTest() {
  describe('fileIoLoopMatrixTest', () => {
    beforeAll(() => {
      console.info('fileIoLoopMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileIoLoopMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_STABILITY_FILE_0100
     * @tc.name      testFileLoop0001
     * @tc.desc      Verify fifty write and read cycles keep the exact payload and size
     */
    it('testFileLoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileLoop0001');
      const path: string = targetFor('rw');
      const payload: string = repeatPayload(256, 'loop');
      try {
        for (let i = 0; i < LOOPS; i++) {
          writeTextFile(path, payload);
          expect(fileIo.statSync(path).size).assertEqual(256);
          expect(readTextFile(path, 256)).assertEqual(payload);
        }
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileLoop0001');
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_FILE_0200
     * @tc.name      testFileLoop0002
     * @tc.desc      Verify fifty create and delete cycles leave no entry behind
     */
    it('testFileLoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileLoop0002');
      for (let i = 0; i < LOOPS; i++) {
        const path: string = targetFor(`create_${i}`);
        writeTextFile(path, `${i}`);
        expect(fileIo.statSync(path).size).assertEqual(`${i}`.length);
        fileIo.unlinkSync(path);
        expect(fileIo.accessSync(path)).assertFalse();
      }
    
      logEnd('testFileLoop0002');
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_FILE_0300
     * @tc.name      testFileLoop0003
     * @tc.desc      Verify fifty append operations grow the file by one byte each time
     */
    it('testFileLoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileLoop0003');
      const path: string = targetFor('append');
      try {
        writeTextFile(path, '');
        for (let i = 0; i < LOOPS; i++) {
          const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
          fileIo.writeSync(file.fd, new Uint8Array([97]).buffer);
          fileIo.closeSync(file);
          expect(fileIo.statSync(path).size).assertEqual(i + 1);
        }
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileLoop0003');
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_FILE_0400
     * @tc.name      testFileLoop0004
     * @tc.desc      Verify fifty truncate cycles always end at the requested size
     */
    it('testFileLoop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileLoop0004');
      const path: string = targetFor('truncate');
      try {
        writeTextFile(path, repeatPayload(1024, 't'));
        for (let i = 0; i < LOOPS; i++) {
          const size: number = (i * 13) % 512;
          fileIo.truncateSync(path, size);
          expect(fileIo.statSync(path).size).assertEqual(size);
        }
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileLoop0004');
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_FILE_0500
     * @tc.name      testFileLoop0005
     * @tc.desc      Verify fifty independent paths keep distinct content without cross talk
     */
    it('testFileLoop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileLoop0005');
      const paths: string[] = [];
      try {
        for (let i = 0; i < LOOPS; i++) {
          const path: string = targetFor(`multi_${i}`);
          paths.push(path);
          writeTextFile(path, `payload-${i}`);
        }
        for (let i = 0; i < paths.length; i++) {
          expect(readTextFile(paths[i], `payload-${i}`.length)).assertEqual(`payload-${i}`);
        }
      } finally {
        for (let i = 0; i < paths.length; i++) {
          removeQuietly(paths[i]);
        }
      }
    
      logEnd('testFileLoop0005');
    })
  });
}
