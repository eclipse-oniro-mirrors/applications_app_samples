/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { util, buffer } from '@kit.ArkTS';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  pathInFiles,
  readTextFile,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function bytesOf(text: string): Uint8Array {
  return util.TextEncoder.create('utf-8').encode(text);
}

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_uf_${label}`, '.txt'));
}

function writeBytes(path: string, bytes: Uint8Array): number {
  const file: fileIo.File = fileIo.openSync(path,
    fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC | fileIo.OpenMode.WRITE_ONLY);
  const payload: ArrayBuffer = new ArrayBuffer(bytes.length);
  new Uint8Array(payload).set(bytes);
  const written: number = fileIo.writeSync(file.fd, payload);
  fileIo.closeSync(file);
  return written;
}

function readBytes(path: string, size: number): Uint8Array {
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
  const payload: ArrayBuffer = new ArrayBuffer(size);
  const readLength: number = fileIo.readSync(file.fd, payload);
  fileIo.closeSync(file);
  expect(readLength).assertEqual(size);
  return new Uint8Array(payload);
}

export default function utilsFileMatrixTest() {
  describe('utilsFileMatrixTest', () => {
    beforeAll(() => {
      console.info('utilsFileMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('utilsFileMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0100
     * @tc.name      testUtilsFile0001
     * @tc.desc      Verify UTF-8 encoded bytes written to a file decode back to the source text
     */
    it('testUtilsFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('utf8');
      const text: string = '音画sync';
      const bytes: Uint8Array = bytesOf(text);
      try {
        expect(writeBytes(path, bytes)).assertEqual(bytes.length);
        expect(fileIo.statSync(path).size).assertEqual(bytes.length);
        const restored: string = util.TextDecoder.create('utf-8').decodeToString(readBytes(path, bytes.length));
        expect(restored).assertEqual(text);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0200
     * @tc.name      testUtilsFile0002
     * @tc.desc      Verify a Base64 string persisted as text decodes to the original bytes
     */
    it('testUtilsFile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('base64');
      const helper: util.Base64Helper = new util.Base64Helper();
      const source: Uint8Array = new Uint8Array([0, 1, 127, 128, 254, 255]);
      const encoded: string = helper.encodeToStringSync(source);
      try {
        writeTextFile(path, encoded);
        const readBack: string = readTextFile(path, encoded.length);
        expect(readBack).assertEqual(encoded);
        const decoded: Uint8Array = helper.decodeSync(readBack);
        expect(decoded.length).assertEqual(source.length);
        for (let i = 0; i < source.length; i++) {
          expect(decoded[i]).assertEqual(source[i]);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0300
     * @tc.name      testUtilsFile0003
     * @tc.desc      Verify hex text persisted in a file reproduces the original buffer bytes
     */
    it('testUtilsFile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('hex');
      const source: buffer.Buffer = buffer.from('abc');
      const hex: string = source.toString('hex');
      try {
        writeTextFile(path, hex);
        expect(hex).assertEqual('616263');
        expect(readTextFile(path, hex.length)).assertEqual('616263');
        const restored: buffer.Buffer = buffer.from(readTextFile(path, hex.length), 'hex');
        expect(restored.length).assertEqual(3);
        expect(restored.toString()).assertEqual('abc');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0400
     * @tc.name      testUtilsFile0004
     * @tc.desc      Verify a UUID persisted as text keeps its canonical shape when read back
     */
    it('testUtilsFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('uuid');
      const uuid: string = util.generateRandomUUID(false);
      try {
        writeTextFile(path, uuid);
        const restored: string = readTextFile(path, uuid.length);
        expect(restored).assertEqual(uuid);
        expect(restored.length).assertEqual(36);
        expect(restored.charAt(14)).assertEqual('4');
        expect(fileIo.statSync(path).size).assertEqual(36);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0500
     * @tc.name      testUtilsFile0005
     * @tc.desc      Verify a binary payload survives file write and read without byte changes
     */
    it('testUtilsFile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('binary');
      const source: Uint8Array = new Uint8Array(256);
      for (let i = 0; i < source.length; i++) {
        source[i] = i;
      }
      try {
        expect(writeBytes(path, source)).assertEqual(256);
        const restored: Uint8Array = readBytes(path, 256);
        for (let i = 0; i < 256; i++) {
          expect(restored[i]).assertEqual(i);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0600
     * @tc.name      testUtilsFile0006
     * @tc.desc      Verify TextEncoder byte length and on-disk size agree for several scripts
     */
    it('testUtilsFile0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const samples: string[] = ['ascii', '中文', 'café', '😀'];
      for (let i = 0; i < samples.length; i++) {
        const path: string = targetFor(`size_${i}`);
        const bytes: Uint8Array = bytesOf(samples[i]);
        try {
          writeBytes(path, bytes);
          expect(fileIo.statSync(path).size).assertEqual(bytes.length);
          expect(buffer.byteLength(samples[i])).assertEqual(bytes.length);
        } finally {
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0700
     * @tc.name      testUtilsFile0007
     * @tc.desc      Verify a chunk of UTF-8 bytes can be read and decoded at a nonzero offset
     */
    it('testUtilsFile0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('offset');
      const text: string = 'HEAD音画TAIL';
      const bytes: Uint8Array = bytesOf(text);
      try {
        writeBytes(path, bytes);
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const bufferBytes: ArrayBuffer = new ArrayBuffer(6);
        fileIo.lseek(file.fd, 4, fileIo.WhenceType.SEEK_SET);
        expect(fileIo.readSync(file.fd, bufferBytes)).assertEqual(6);
        fileIo.closeSync(file);
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array(bufferBytes))).assertEqual('音画');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_UTIL_FILE_0800
     * @tc.name      testUtilsFile0008
     * @tc.desc      Verify a JSON-like payload built from utilities round-trips through the file
     */
    it('testUtilsFile0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('json');
      const uuid: string = util.generateRandomUUID(false);
      const payload: string = `{"id":"${uuid}","fps":30}`;
      try {
        expect(writeTextFile(path, payload)).assertEqual(bytesOf(payload).length);
        const restored: string = readTextFile(path, bytesOf(payload).length);
        expect(restored).assertEqual(payload);
        expect(restored.indexOf(uuid) >= 0).assertTrue();
        expect(restored.endsWith('"fps":30}')).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })
  });
}
