/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  appContext,
  pathExists,
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function throws(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    return true;
  }
}

export default function pathInputMatrixTest() {
  describe('pathInputMatrixTest', () => {
    beforeAll(() => {
      console.info('pathInputMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('pathInputMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_PATH_0100
     * @tc.name      testPathInput0001
     * @tc.desc      Verify opening an empty path fails instead of creating an entry
     */
    it('testPathInput0001', 0, () => {
      const failed: boolean = throws(() => {
        fileIo.openSync('', fileIo.OpenMode.READ_ONLY);
      });
      expect(failed).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_PATH_0200
     * @tc.name      testPathInput0002
     * @tc.desc      Verify an over-long file name fails and leaves no entry behind
     */
    it('testPathInput0002', 0, () => {
      const longName: string = repeatPayload(300, 'n') + '.txt';
      const path: string = pathInFiles(longName);
      const failed: boolean = throws(() => {
        writeTextFile(path, 'x');
      });
      expect(failed).assertTrue();
      expect(pathExists(path)).assertFalse();
      removeQuietly(path);
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_PATH_0300
     * @tc.name      testPathInput0003
     * @tc.desc      Verify a file name with spaces works end to end
     */
    it('testPathInput0003', 0, () => {
      const name: string = uniqueName('avs path space', '.txt');
      const path: string = pathInFiles(name);
      try {
        writeTextFile(path, 'space');
        expect(fileIo.statSync(path).size).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual('space');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_PATH_0400
     * @tc.name      testPathInput0004
     * @tc.desc      Verify a CJK file name works end to end
     */
    it('testPathInput0004', 0, () => {
      const name: string = uniqueName('音画文件', '.txt');
      const path: string = pathInFiles(name);
      try {
        writeTextFile(path, 'cjk-name');
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('cjk-name');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_PATH_0500
     * @tc.name      testPathInput0005
     * @tc.desc      Verify a path containing a current-directory segment resolves correctly
     */
    it('testPathInput0005', 0, () => {
      const name: string = uniqueName('avs_dot_path', '.txt');
      const path: string = `${appContext().filesDir}/./${name}`;
      try {
        writeTextFile(path, 'dot');
        expect(readTextFile(path, 3)).assertEqual('dot');
        expect(pathExists(`${appContext().filesDir}/${name}`)).assertTrue();
      } finally {
        removeQuietly(`${appContext().filesDir}/${name}`);
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_PATH_0600
     * @tc.name      testPathInput0006
     * @tc.desc      Verify a name containing several consecutive dots is still addressable
     */
    it('testPathInput0006', 0, () => {
      const name: string = uniqueName('avs...dots', '.txt');
      const path: string = pathInFiles(name);
      try {
        writeTextFile(path, 'dots');
        expect(fileIo.statSync(path).size).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual('dots');
        expect(path.indexOf('...') >= 0).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })
  });
}
