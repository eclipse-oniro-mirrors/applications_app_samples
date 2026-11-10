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

const ROUNDS: number = 20;
const BUDGET_MS: number = 20000;

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_tp_${label}`, '.txt'));
}

function roundTrip(size: number, label: string): number {
  const path: string = targetFor(label);
  const payload: string = repeatPayload(size, 'tp');
  try {
    const start: number = Date.now();
    for (let i = 0; i < ROUNDS; i++) {
      writeTextFile(path, payload);
      expect(readTextFile(path, size)).assertEqual(payload);
    }
    return Date.now() - start;
  } finally {
    removeQuietly(path);
  }
}

export default function fileThroughputMatrixTest() {
  describe('fileThroughputMatrixTest', () => {
    beforeAll(() => {
      console.info('fileThroughputMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileThroughputMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_PERF_FILE_0100
     * @tc.name      testFileThroughput0001
     * @tc.desc      Verify twenty write and read cycles of a 64 byte file stay within budget
     */
    it('testFileThroughput0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cost: number = roundTrip(64, '64');
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_FILE_0200
     * @tc.name      testFileThroughput0002
     * @tc.desc      Verify twenty write and read cycles of a 1 KB file stay within budget
     */
    it('testFileThroughput0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cost: number = roundTrip(1024, '1024');
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_FILE_0300
     * @tc.name      testFileThroughput0003
     * @tc.desc      Verify twenty write and read cycles of an 8 KB file stay within budget
     */
    it('testFileThroughput0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cost: number = roundTrip(8192, '8192');
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_FILE_0400
     * @tc.name      testFileThroughput0004
     * @tc.desc      Verify the larger payload does not report a smaller size after the last write
     */
    it('testFileThroughput0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('final');
      try {
        writeTextFile(path, repeatPayload(64, 'a'));
        expect(fileIo.statSync(path).size).assertEqual(64);
        writeTextFile(path, repeatPayload(8192, 'b'));
        expect(fileIo.statSync(path).size).assertEqual(8192);
        expect(readTextFile(path, 8192).length).assertEqual(8192);
      } finally {
        removeQuietly(path);
      }
    })
  });
}
