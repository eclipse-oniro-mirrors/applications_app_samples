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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import hash from '@ohos.file.hash';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
import { ensureDir, writeTextFile } from '../common/FileTestHelper';
/**
 * Content digests of cached media files.
 * Two picks of the same photo must be recognised as one payload, which is
 * exactly what a file digest answers. The cases pin the published algorithms
 * against known vectors and against the equality rules a cache relies on.
 */
const BASE_DIR: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir +
  '/publish_hash_cases';
const ABC_SHA256: string = 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';
const ABC_SHA1: string = 'a9993e364706816aba3e25717850c26c9cd0d' + '89d';
const ABC_MD5: string = '900150983cd24fb0d6963f7d28e17f72';
const EMPTY_SHA256: string = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';
export default function fileHashTest() {
  describe('FileHashTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      ensureDir(BASE_DIR);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0100
     * @tc.name Sha256KnownVector001
     * @tc.desc Verify the sha256 digest of a known payload matches the published vector
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha256KnownVector_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha256KnownVector_001 begin');
      const path: string = ensureDir(BASE_DIR) + '/vector_sha256.txt';
      writeTextFile(path, 'abc');
      const digest: string = await hash.hash(path, 'sha256');
      expect(digest.toLowerCase()).assertEqual(ABC_SHA256);
      fs.unlinkSync(path);
      Logger.info(TAG, 'Sha256KnownVector_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0200
     * @tc.name Sha1KnownVector002
     * @tc.desc Verify the sha1 digest of a known payload matches the published vector
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha1KnownVector_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha1KnownVector_002 begin');
      const path: string = ensureDir(BASE_DIR) + '/vector_sha1.txt';
      writeTextFile(path, 'abc');
      const digest: string = await hash.hash(path, 'sha1');
      expect(digest.toLowerCase()).assertEqual(ABC_SHA1);
      fs.unlinkSync(path);
      Logger.info(TAG, 'Sha1KnownVector_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0300
     * @tc.name Md5KnownVector003
     * @tc.desc Verify the md5 digest of a known payload matches the published vector
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Md5KnownVector_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Md5KnownVector_003 begin');
      const path: string = ensureDir(BASE_DIR) + '/vector_md5.txt';
      writeTextFile(path, 'abc');
      const digest: string = await hash.hash(path, 'md5');
      expect(digest.toLowerCase()).assertEqual(ABC_MD5);
      fs.unlinkSync(path);
      Logger.info(TAG, 'Md5KnownVector_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0400
     * @tc.name EqualPayloadsShareDigest004
     * @tc.desc Verify two files with identical content produce one digest
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EqualPayloadsShareDigest_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EqualPayloadsShareDigest_004 begin');
      const first: string = ensureDir(BASE_DIR) + '/same_one.txt';
      const second: string = ensureDir(BASE_DIR) + '/same_two.txt';
      writeTextFile(first, 'same body');
      writeTextFile(second, 'same body');
      const firstDigest: string = await hash.hash(first, 'sha256');
      const secondDigest: string = await hash.hash(second, 'sha256');
      expect(secondDigest).assertEqual(firstDigest);
      fs.unlinkSync(first);
      fs.unlinkSync(second);
      Logger.info(TAG, 'EqualPayloadsShareDigest_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0500
     * @tc.name DifferentPayloadsDiffer005
     * @tc.desc Verify a single changed byte produces a different digest
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DifferentPayloadsDiffer_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DifferentPayloadsDiffer_005 begin');
      const first: string = ensureDir(BASE_DIR) + '/diff_one.txt';
      const second: string = ensureDir(BASE_DIR) + '/diff_two.txt';
      writeTextFile(first, 'same bodY');
      writeTextFile(second, 'same body');
      const firstDigest: string = await hash.hash(first, 'sha256');
      const secondDigest: string = await hash.hash(second, 'sha256');
      expect(firstDigest !== secondDigest).assertTrue();
      fs.unlinkSync(first);
      fs.unlinkSync(second);
      Logger.info(TAG, 'DifferentPayloadsDiffer_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0600
     * @tc.name Sha256DigestLength006
     * @tc.desc Verify a sha256 digest occupies thirty two bytes of hex text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Sha256DigestLength_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Sha256DigestLength_006 begin');
      const path: string = ensureDir(BASE_DIR) + '/length_probe.txt';
      writeTextFile(path, 'publish');
      const digest: string = await hash.hash(path, 'sha256');
      expect(digest.length).assertEqual(64);
      fs.unlinkSync(path);
      Logger.info(TAG, 'Sha256DigestLength_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0700
     * @tc.name MissingFileRejects007
     * @tc.desc Verify hashing an absent path is rejected instead of returning a value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MissingFileRejects_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'MissingFileRejects_007 begin');
      let rejected: boolean = false;
      try {
        await hash.hash(ensureDir(BASE_DIR) + '/never_written.txt', 'sha256');
      }
      catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      Logger.info(TAG, 'MissingFileRejects_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HASH_0800
     * @tc.name EmptyFileKnownVector008
     * @tc.desc Verify an empty payload hashes to the published empty sha256 vector
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyFileKnownVector_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EmptyFileKnownVector_008 begin');
      const path: string = ensureDir(BASE_DIR) + '/empty_payload.txt';
      writeTextFile(path, '');
      const digest: string = await hash.hash(path, 'sha256');
      expect(digest.toLowerCase()).assertEqual(EMPTY_SHA256);
      fs.unlinkSync(path);
      Logger.info(TAG, 'EmptyFileKnownVector_008 end');
      done();
    });
  });
}
