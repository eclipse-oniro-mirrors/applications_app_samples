/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  encodeText,
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_wp_${label}`, '.txt'));
}

function appendTo(path: string, text: string): number {
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
  const written: number = fileIo.writeSync(file.fd, encodeText(text));
  fileIo.closeSync(file);
  return written;
}

export default function fileWritePatternMatrixTest() {
  describe('fileWritePatternMatrixTest', () => {
    beforeAll(() => {
      console.info('fileWritePatternMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileWritePatternMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0100
     * @tc.name      testFileWrite0001
     * @tc.desc      Verify overwriting a long file with a short payload shrinks it
     */
    it('testFileWrite0001', 0, () => {
      const path: string = targetFor('short');
      try {
        writeTextFile(path, 'long-long-long');
        expect(fileIo.statSync(path).size).assertEqual(14);
        writeTextFile(path, 'short');
        expect(fileIo.statSync(path).size).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual('short');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0200
     * @tc.name      testFileWrite0002
     * @tc.desc      Verify overwriting a short file with a longer payload grows it
     */
    it('testFileWrite0002', 0, () => {
      const path: string = targetFor('long');
      try {
        writeTextFile(path, 'short');
        writeTextFile(path, 'much-longer-payload');
        expect(fileIo.statSync(path).size).assertEqual(19);
        expect(readTextFile(path, 19)).assertEqual('much-longer-payload');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0300
     * @tc.name      testFileWrite0003
     * @tc.desc      Verify overwriting with the same length keeps the size and replaces content
     */
    it('testFileWrite0003', 0, () => {
      const path: string = targetFor('same');
      try {
        writeTextFile(path, 'AAAAA');
        writeTextFile(path, 'BBBBB');
        expect(fileIo.statSync(path).size).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual('BBBBB');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0400
     * @tc.name      testFileWrite0004
     * @tc.desc      Verify overwriting with an empty payload leaves a zero-byte file
     */
    it('testFileWrite0004', 0, () => {
      const path: string = targetFor('empty');
      try {
        writeTextFile(path, 'content');
        writeTextFile(path, '');
        expect(fileIo.statSync(path).size).assertEqual(0);
        expect(readTextFile(path, 0)).assertEqual('');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0500
     * @tc.name      testFileWrite0005
     * @tc.desc      Verify overwriting with a UTF-8 payload reports the encoded byte length
     */
    it('testFileWrite0005', 0, () => {
      const path: string = targetFor('utf8');
      try {
        writeTextFile(path, 'ascii');
        const payload: string = '音画sync';
        const bytes: number = writeTextFile(path, payload);
        expect(bytes).assertEqual(encodeText(payload).byteLength);
        expect(fileIo.statSync(path).size).assertEqual(bytes);
        expect(readTextFile(path, bytes)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0600
     * @tc.name      testFileWrite0006
     * @tc.desc      Verify overwriting does not change a file into a different node type
     */
    it('testFileWrite0006', 0, () => {
      const path: string = targetFor('type');
      try {
        writeTextFile(path, 'a');
        writeTextFile(path, 'bb');
        expect(fileIo.statSync(path).isFile()).assertTrue();
        expect(fileIo.statSync(path).isDirectory()).assertFalse();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0700
     * @tc.name      testFileWrite0007
     * @tc.desc      Verify appending one character to an empty file yields size one
     */
    it('testFileWrite0007', 0, () => {
      const path: string = targetFor('append_one');
      try {
        writeTextFile(path, '');
        expect(appendTo(path, 'x')).assertEqual(1);
        expect(fileIo.statSync(path).size).assertEqual(1);
        expect(readTextFile(path, 1)).assertEqual('x');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0800
     * @tc.name      testFileWrite0008
     * @tc.desc      Verify two appends stack in order and sum their sizes
     */
    it('testFileWrite0008', 0, () => {
      const path: string = targetFor('append_two');
      try {
        writeTextFile(path, 'A');
        appendTo(path, 'B');
        appendTo(path, 'C');
        expect(fileIo.statSync(path).size).assertEqual(3);
        expect(readTextFile(path, 3)).assertEqual('ABC');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_0900
     * @tc.name      testFileWrite0009
     * @tc.desc      Verify multiple appended chunks produce the sum of their lengths
     */
    it('testFileWrite0009', 0, () => {
      const path: string = targetFor('append_many');
      try {
        writeTextFile(path, '');
        const sizes: number[] = [1, 2, 4, 8, 16];
        let total: number = 0;
        for (let i = 0; i < sizes.length; i++) {
          total += appendTo(path, repeatPayload(sizes[i], 'x'));
          expect(fileIo.statSync(path).size).assertEqual(total);
        }
        expect(total).assertEqual(31);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_1000
     * @tc.name      testFileWrite0010
     * @tc.desc      Verify appending a UTF-8 payload reports the encoded byte count
     */
    it('testFileWrite0010', 0, () => {
      const path: string = targetFor('append_utf8');
      try {
        writeTextFile(path, 'head-');
        const payload: string = '音画';
        expect(appendTo(path, payload)).assertEqual(encodeText(payload).byteLength);
        expect(fileIo.statSync(path).size).assertEqual(5 + encodeText(payload).byteLength);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_1100
     * @tc.name      testFileWrite0011
     * @tc.desc      Verify appending after truncation starts from the truncated length
     */
    it('testFileWrite0011', 0, () => {
      const path: string = targetFor('append_after_truncate');
      try {
        writeTextFile(path, repeatPayload(256, 'z'));
        fileIo.truncateSync(path, 4);
        appendTo(path, 'tail');
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8).endsWith('tail')).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_1200
     * @tc.name      testFileWrite0012
     * @tc.desc      Verify overwrite then append keeps the overwrite prefix and the appended suffix
     */
    it('testFileWrite0012', 0, () => {
      const path: string = targetFor('overwrite_append');
      try {
        writeTextFile(path, 'old');
        writeTextFile(path, 'new');
        appendTo(path, '-end');
        expect(fileIo.statSync(path).size).assertEqual(7);
        expect(readTextFile(path, 7)).assertEqual('new-end');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_1300
     * @tc.name      testFileWrite0013
     * @tc.desc      Verify repeated identical overwrites are idempotent in size and content
     */
    it('testFileWrite0013', 0, () => {
      const path: string = targetFor('idempotent');
      try {
        const payload: string = repeatPayload(128, 'idem');
        for (let i = 0; i < 5; i++) {
          writeTextFile(path, payload);
          expect(fileIo.statSync(path).size).assertEqual(128);
          expect(readTextFile(path, 128)).assertEqual(payload);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_WRITE_1400
     * @tc.name      testFileWrite0014
     * @tc.desc      Verify a truncate to zero followed by append yields only the appended content
     */
    it('testFileWrite0014', 0, () => {
      const path: string = targetFor('truncate_append');
      try {
        writeTextFile(path, 'discarded');
        fileIo.truncateSync(path, 0);
        appendTo(path, 'kept');
        expect(fileIo.statSync(path).size).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual('kept');
      } finally {
        removeQuietly(path);
      }
    })
  });
}
