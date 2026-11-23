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

import { describe, expect, it, Level, Size, TestType, beforeEach } from '@ohos/hypium';
import { queryStorage, StorageOperation } from '../../../main/ets/model/StorageQuery';
import { logCase, logAssertion, StorageQueryProbe, yieldTestLoop } from './StorageTestSupport';

export default function storageRoutingSuite01Test(): void {
  describe('StorageRoutingSuite01', (): void => {
    beforeEach(yieldTestLoop);
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0100
     * @tc.name AppFsSpace_Routing_0001
     * @tc.desc Verify BUNDLE delegates empty storage (0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0001';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 0;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0200
     * @tc.name AppFsSpace_Routing_0002
     * @tc.desc Verify BUNDLE delegates signed zero (-0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0002';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = -0;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualSignedZero: boolean = 1 / actualBytes === Number.NEGATIVE_INFINITY;
          logAssertion(name, "BUNDLE bytes=-0; sign is preserved without coercion", actualSignedZero, true);
          expect(actualSignedZero).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0300
     * @tc.name AppFsSpace_Routing_0003
     * @tc.desc Verify BUNDLE delegates one byte (1) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0003';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1; returned bytes", actualBytes, 1);
          expect(actualBytes).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0400
     * @tc.name AppFsSpace_Routing_0004
     * @tc.desc Verify BUNDLE delegates last byte below KiB (1023) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0004';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1023;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1023; returned bytes", actualBytes, 1023);
          expect(actualBytes).assertEqual(1023);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0500
     * @tc.name AppFsSpace_Routing_0005
     * @tc.desc Verify BUNDLE delegates KiB boundary (1024) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0005';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0600
     * @tc.name AppFsSpace_Routing_0006
     * @tc.desc Verify BUNDLE delegates first byte above KiB (1025) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0006';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1025;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1025; returned bytes", actualBytes, 1025);
          expect(actualBytes).assertEqual(1025);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0700
     * @tc.name AppFsSpace_Routing_0007
     * @tc.desc Verify BUNDLE delegates last byte below MiB (1048575) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0007';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1048575;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1048575; returned bytes", actualBytes, 1048575);
          expect(actualBytes).assertEqual(1048575);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0800
     * @tc.name AppFsSpace_Routing_0008
     * @tc.desc Verify BUNDLE delegates MiB boundary (1048576) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0008';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1048576;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1048576; returned bytes", actualBytes, 1048576);
          expect(actualBytes).assertEqual(1048576);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_0900
     * @tc.name AppFsSpace_Routing_0009
     * @tc.desc Verify BUNDLE delegates last byte below GiB (1073741823) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0009';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1073741823;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1073741823; returned bytes", actualBytes, 1073741823);
          expect(actualBytes).assertEqual(1073741823);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_1000
     * @tc.name AppFsSpace_Routing_0010
     * @tc.desc Verify BUNDLE delegates GiB boundary (1073741824) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0010';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1073741824;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1073741824; returned bytes", actualBytes, 1073741824);
          expect(actualBytes).assertEqual(1073741824);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_1100
     * @tc.name AppFsSpace_Routing_0011
     * @tc.desc Verify BUNDLE delegates TiB boundary (1099511627776) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0011';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1099511627776;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1099511627776; returned bytes", actualBytes, 1099511627776);
          expect(actualBytes).assertEqual(1099511627776);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_1200
     * @tc.name AppFsSpace_Routing_0012
     * @tc.desc Verify BUNDLE delegates PiB boundary (1125899906842624) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0012';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1125899906842624;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1125899906842624; returned bytes", actualBytes, 1125899906842624);
          expect(actualBytes).assertEqual(1125899906842624);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_1300
     * @tc.name AppFsSpace_Routing_0013
     * @tc.desc Verify BUNDLE delegates penultimate safe integer (9007199254740990) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0013';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740990;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=9007199254740990; returned bytes", actualBytes, 9007199254740990);
          expect(actualBytes).assertEqual(9007199254740990);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_BUNDLE_G1_1400
     * @tc.name AppFsSpace_Routing_0014
     * @tc.desc Verify BUNDLE delegates maximum safe integer (9007199254740991) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0014';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740991;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0015
     * @tc.desc Verify FILESYSTEM_FREE delegates empty storage (0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0015';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 0;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0016
     * @tc.desc Verify FILESYSTEM_FREE delegates signed zero (-0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0016';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = -0;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualSignedZero: boolean = 1 / actualBytes === Number.NEGATIVE_INFINITY;
          logAssertion(name, "FILESYSTEM_FREE bytes=-0; sign is preserved without coercion", actualSignedZero, true);
          expect(actualSignedZero).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0017
     * @tc.desc Verify FILESYSTEM_FREE delegates one byte (1) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0017';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1; returned bytes", actualBytes, 1);
          expect(actualBytes).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0400
     * @tc.name AppFsSpace_Routing_0018
     * @tc.desc Verify FILESYSTEM_FREE delegates last byte below KiB (1023) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0018';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1023;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1023; returned bytes", actualBytes, 1023);
          expect(actualBytes).assertEqual(1023);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0500
     * @tc.name AppFsSpace_Routing_0019
     * @tc.desc Verify FILESYSTEM_FREE delegates KiB boundary (1024) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0019';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0600
     * @tc.name AppFsSpace_Routing_0020
     * @tc.desc Verify FILESYSTEM_FREE delegates first byte above KiB (1025) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0020';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1025;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1025; returned bytes", actualBytes, 1025);
          expect(actualBytes).assertEqual(1025);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0700
     * @tc.name AppFsSpace_Routing_0021
     * @tc.desc Verify FILESYSTEM_FREE delegates last byte below MiB (1048575) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0021';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1048575;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1048575; returned bytes", actualBytes, 1048575);
          expect(actualBytes).assertEqual(1048575);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0800
     * @tc.name AppFsSpace_Routing_0022
     * @tc.desc Verify FILESYSTEM_FREE delegates MiB boundary (1048576) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0022';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1048576;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1048576; returned bytes", actualBytes, 1048576);
          expect(actualBytes).assertEqual(1048576);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_0900
     * @tc.name AppFsSpace_Routing_0023
     * @tc.desc Verify FILESYSTEM_FREE delegates last byte below GiB (1073741823) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0023';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1073741823;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1073741823; returned bytes", actualBytes, 1073741823);
          expect(actualBytes).assertEqual(1073741823);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_1000
     * @tc.name AppFsSpace_Routing_0024
     * @tc.desc Verify FILESYSTEM_FREE delegates GiB boundary (1073741824) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0024';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1073741824;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE expected bytes=1073741824; returned bytes", actualBytes, 1073741824);
          expect(actualBytes).assertEqual(1073741824);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_1100
     * @tc.name AppFsSpace_Routing_0025
     * @tc.desc Verify FILESYSTEM_FREE delegates TiB boundary (1099511627776) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0025';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1099511627776;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FILESYSTEM_FREE expected bytes=1099511627776; returned bytes", actualBytes, 1099511627776);
          expect(actualBytes).assertEqual(1099511627776);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_1200
     * @tc.name AppFsSpace_Routing_0026
     * @tc.desc Verify FILESYSTEM_FREE delegates PiB boundary (1125899906842624) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0026';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1125899906842624;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FILESYSTEM_FREE expected bytes=1125899906842624; returned bytes", actualBytes, 1125899906842624);
          expect(actualBytes).assertEqual(1125899906842624);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_1300
     * @tc.name AppFsSpace_Routing_0027
     * @tc.desc Verify FILESYSTEM_FREE delegates penultimate safe integer (9007199254740990) without changing the byte
     * count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0027';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 9007199254740990;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FILESYSTEM_FREE expected bytes=9007199254740990; returned bytes", actualBytes, 9007199254740990);
          expect(actualBytes).assertEqual(9007199254740990);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FILESYSTEM_FREE_G1_1400
     * @tc.name AppFsSpace_Routing_0028
     * @tc.desc Verify FILESYSTEM_FREE delegates maximum safe integer (9007199254740991) without changing the byte
     * count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0028';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 9007199254740991;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FILESYSTEM_FREE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; selected dependency and exclusive call record",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0100
     * @tc.name AppFsSpace_Routing_0029
     * @tc.desc Verify TOTAL delegates empty storage (0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0029';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 0;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0200
     * @tc.name AppFsSpace_Routing_0030
     * @tc.desc Verify TOTAL delegates signed zero (-0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0030';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = -0;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
          const actualSignedZero: boolean = 1 / actualBytes === Number.NEGATIVE_INFINITY;
          logAssertion(name, "TOTAL bytes=-0; sign is preserved without coercion", actualSignedZero, true);
          expect(actualSignedZero).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0300
     * @tc.name AppFsSpace_Routing_0031
     * @tc.desc Verify TOTAL delegates one byte (1) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0031';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1; returned bytes", actualBytes, 1);
          expect(actualBytes).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0400
     * @tc.name AppFsSpace_Routing_0032
     * @tc.desc Verify TOTAL delegates last byte below KiB (1023) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0032';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1023;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1023; returned bytes", actualBytes, 1023);
          expect(actualBytes).assertEqual(1023);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0500
     * @tc.name AppFsSpace_Routing_0033
     * @tc.desc Verify TOTAL delegates KiB boundary (1024) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0033';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0600
     * @tc.name AppFsSpace_Routing_0034
     * @tc.desc Verify TOTAL delegates first byte above KiB (1025) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0034';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1025;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1025; returned bytes", actualBytes, 1025);
          expect(actualBytes).assertEqual(1025);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0700
     * @tc.name AppFsSpace_Routing_0035
     * @tc.desc Verify TOTAL delegates last byte below MiB (1048575) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0035';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1048575;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1048575; returned bytes", actualBytes, 1048575);
          expect(actualBytes).assertEqual(1048575);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0800
     * @tc.name AppFsSpace_Routing_0036
     * @tc.desc Verify TOTAL delegates MiB boundary (1048576) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0036';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1048576;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1048576; returned bytes", actualBytes, 1048576);
          expect(actualBytes).assertEqual(1048576);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_0900
     * @tc.name AppFsSpace_Routing_0037
     * @tc.desc Verify TOTAL delegates last byte below GiB (1073741823) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0037';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1073741823;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1073741823; returned bytes", actualBytes, 1073741823);
          expect(actualBytes).assertEqual(1073741823);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_1000
     * @tc.name AppFsSpace_Routing_0038
     * @tc.desc Verify TOTAL delegates GiB boundary (1073741824) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0038';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1073741824;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1073741824; returned bytes", actualBytes, 1073741824);
          expect(actualBytes).assertEqual(1073741824);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_1100
     * @tc.name AppFsSpace_Routing_0039
     * @tc.desc Verify TOTAL delegates TiB boundary (1099511627776) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0039';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1099511627776;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1099511627776; returned bytes", actualBytes, 1099511627776);
          expect(actualBytes).assertEqual(1099511627776);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_1200
     * @tc.name AppFsSpace_Routing_0040
     * @tc.desc Verify TOTAL delegates PiB boundary (1125899906842624) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0040';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1125899906842624;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=1125899906842624; returned bytes", actualBytes, 1125899906842624);
          expect(actualBytes).assertEqual(1125899906842624);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_1300
     * @tc.name AppFsSpace_Routing_0041
     * @tc.desc Verify TOTAL delegates penultimate safe integer (9007199254740990) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0041';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 9007199254740990;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=9007199254740990; returned bytes", actualBytes, 9007199254740990);
          expect(actualBytes).assertEqual(9007199254740990);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_G1_1400
     * @tc.name AppFsSpace_Routing_0042
     * @tc.desc Verify TOTAL delegates maximum safe integer (9007199254740991) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0042';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 9007199254740991;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0043
     * @tc.desc Verify TOTAL_SYNC delegates empty storage (0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0043';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 0;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0044
     * @tc.desc Verify TOTAL_SYNC delegates signed zero (-0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0044';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = -0;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
          const actualSignedZero: boolean = 1 / actualBytes === Number.NEGATIVE_INFINITY;
          logAssertion(name, "TOTAL_SYNC bytes=-0; sign is preserved without coercion", actualSignedZero, true);
          expect(actualSignedZero).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0300
     * @tc.name AppFsSpace_Routing_0045
     * @tc.desc Verify TOTAL_SYNC delegates one byte (1) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0045';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1; returned bytes", actualBytes, 1);
          expect(actualBytes).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0400
     * @tc.name AppFsSpace_Routing_0046
     * @tc.desc Verify TOTAL_SYNC delegates last byte below KiB (1023) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0046';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1023;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1023; returned bytes", actualBytes, 1023);
          expect(actualBytes).assertEqual(1023);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0500
     * @tc.name AppFsSpace_Routing_0047
     * @tc.desc Verify TOTAL_SYNC delegates KiB boundary (1024) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0047';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0600
     * @tc.name AppFsSpace_Routing_0048
     * @tc.desc Verify TOTAL_SYNC delegates first byte above KiB (1025) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0048';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1025;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1025; returned bytes", actualBytes, 1025);
          expect(actualBytes).assertEqual(1025);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0700
     * @tc.name AppFsSpace_Routing_0049
     * @tc.desc Verify TOTAL_SYNC delegates last byte below MiB (1048575) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0049';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1048575;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1048575; returned bytes", actualBytes, 1048575);
          expect(actualBytes).assertEqual(1048575);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0800
     * @tc.name AppFsSpace_Routing_0050
     * @tc.desc Verify TOTAL_SYNC delegates MiB boundary (1048576) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0050';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1048576;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1048576; returned bytes", actualBytes, 1048576);
          expect(actualBytes).assertEqual(1048576);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_0900
     * @tc.name AppFsSpace_Routing_0051
     * @tc.desc Verify TOTAL_SYNC delegates last byte below GiB (1073741823) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0051';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1073741823;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1073741823; returned bytes", actualBytes, 1073741823);
          expect(actualBytes).assertEqual(1073741823);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_1000
     * @tc.name AppFsSpace_Routing_0052
     * @tc.desc Verify TOTAL_SYNC delegates GiB boundary (1073741824) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0052';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1073741824;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1073741824; returned bytes", actualBytes, 1073741824);
          expect(actualBytes).assertEqual(1073741824);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_1100
     * @tc.name AppFsSpace_Routing_0053
     * @tc.desc Verify TOTAL_SYNC delegates TiB boundary (1099511627776) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0053';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1099511627776;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1099511627776; returned bytes", actualBytes, 1099511627776);
          expect(actualBytes).assertEqual(1099511627776);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_1200
     * @tc.name AppFsSpace_Routing_0054
     * @tc.desc Verify TOTAL_SYNC delegates PiB boundary (1125899906842624) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0054';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1125899906842624;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "TOTAL_SYNC expected bytes=1125899906842624; returned bytes", actualBytes, 1125899906842624);
          expect(actualBytes).assertEqual(1125899906842624);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_1300
     * @tc.name AppFsSpace_Routing_0055
     * @tc.desc Verify TOTAL_SYNC delegates penultimate safe integer (9007199254740990) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0055';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 9007199254740990;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "TOTAL_SYNC expected bytes=9007199254740990; returned bytes", actualBytes, 9007199254740990);
          expect(actualBytes).assertEqual(9007199254740990);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_TOTAL_SYNC_G1_1400
     * @tc.name AppFsSpace_Routing_0056
     * @tc.desc Verify TOTAL_SYNC delegates maximum safe integer (9007199254740991) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0056';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 9007199254740991;
          const actualBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "TOTAL_SYNC expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0057
     * @tc.desc Verify FREE delegates empty storage (0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0057';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 0;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0058
     * @tc.desc Verify FREE delegates signed zero (-0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0058';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = -0;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
          const actualSignedZero: boolean = 1 / actualBytes === Number.NEGATIVE_INFINITY;
          logAssertion(name, "FREE bytes=-0; sign is preserved without coercion", actualSignedZero, true);
          expect(actualSignedZero).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0059
     * @tc.desc Verify FREE delegates one byte (1) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0059';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1; returned bytes", actualBytes, 1);
          expect(actualBytes).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0400
     * @tc.name AppFsSpace_Routing_0060
     * @tc.desc Verify FREE delegates last byte below KiB (1023) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0060';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1023;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1023; returned bytes", actualBytes, 1023);
          expect(actualBytes).assertEqual(1023);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0500
     * @tc.name AppFsSpace_Routing_0061
     * @tc.desc Verify FREE delegates KiB boundary (1024) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0061';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0600
     * @tc.name AppFsSpace_Routing_0062
     * @tc.desc Verify FREE delegates first byte above KiB (1025) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0062';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1025;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1025; returned bytes", actualBytes, 1025);
          expect(actualBytes).assertEqual(1025);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0700
     * @tc.name AppFsSpace_Routing_0063
     * @tc.desc Verify FREE delegates last byte below MiB (1048575) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0063';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1048575;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1048575; returned bytes", actualBytes, 1048575);
          expect(actualBytes).assertEqual(1048575);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0800
     * @tc.name AppFsSpace_Routing_0064
     * @tc.desc Verify FREE delegates MiB boundary (1048576) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0064';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1048576;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1048576; returned bytes", actualBytes, 1048576);
          expect(actualBytes).assertEqual(1048576);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_0900
     * @tc.name AppFsSpace_Routing_0065
     * @tc.desc Verify FREE delegates last byte below GiB (1073741823) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0065';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1073741823;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1073741823; returned bytes", actualBytes, 1073741823);
          expect(actualBytes).assertEqual(1073741823);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_1000
     * @tc.name AppFsSpace_Routing_0066
     * @tc.desc Verify FREE delegates GiB boundary (1073741824) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0066';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1073741824;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1073741824; returned bytes", actualBytes, 1073741824);
          expect(actualBytes).assertEqual(1073741824);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_1100
     * @tc.name AppFsSpace_Routing_0067
     * @tc.desc Verify FREE delegates TiB boundary (1099511627776) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0067';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1099511627776;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1099511627776; returned bytes", actualBytes, 1099511627776);
          expect(actualBytes).assertEqual(1099511627776);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_1200
     * @tc.name AppFsSpace_Routing_0068
     * @tc.desc Verify FREE delegates PiB boundary (1125899906842624) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0068';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1125899906842624;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=1125899906842624; returned bytes", actualBytes, 1125899906842624);
          expect(actualBytes).assertEqual(1125899906842624);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_1300
     * @tc.name AppFsSpace_Routing_0069
     * @tc.desc Verify FREE delegates penultimate safe integer (9007199254740990) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0069';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 9007199254740990;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=9007199254740990; returned bytes", actualBytes, 9007199254740990);
          expect(actualBytes).assertEqual(9007199254740990);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_G1_1400
     * @tc.name AppFsSpace_Routing_0070
     * @tc.desc Verify FREE delegates maximum safe integer (9007199254740991) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0070';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 9007199254740991;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0071
     * @tc.desc Verify FREE_SYNC delegates empty storage (0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0071';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 0;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0072
     * @tc.desc Verify FREE_SYNC delegates signed zero (-0) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0072';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = -0;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=0; returned bytes", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
          const actualSignedZero: boolean = 1 / actualBytes === Number.NEGATIVE_INFINITY;
          logAssertion(name, "FREE_SYNC bytes=-0; sign is preserved without coercion", actualSignedZero, true);
          expect(actualSignedZero).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0300
     * @tc.name AppFsSpace_Routing_0073
     * @tc.desc Verify FREE_SYNC delegates one byte (1) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0073';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1; returned bytes", actualBytes, 1);
          expect(actualBytes).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0400
     * @tc.name AppFsSpace_Routing_0074
     * @tc.desc Verify FREE_SYNC delegates last byte below KiB (1023) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0074';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1023;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1023; returned bytes", actualBytes, 1023);
          expect(actualBytes).assertEqual(1023);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0500
     * @tc.name AppFsSpace_Routing_0075
     * @tc.desc Verify FREE_SYNC delegates KiB boundary (1024) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0075';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0600
     * @tc.name AppFsSpace_Routing_0076
     * @tc.desc Verify FREE_SYNC delegates first byte above KiB (1025) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0076';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1025;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1025; returned bytes", actualBytes, 1025);
          expect(actualBytes).assertEqual(1025);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0700
     * @tc.name AppFsSpace_Routing_0077
     * @tc.desc Verify FREE_SYNC delegates last byte below MiB (1048575) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0077';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1048575;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1048575; returned bytes", actualBytes, 1048575);
          expect(actualBytes).assertEqual(1048575);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0800
     * @tc.name AppFsSpace_Routing_0078
     * @tc.desc Verify FREE_SYNC delegates MiB boundary (1048576) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0078';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1048576;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1048576; returned bytes", actualBytes, 1048576);
          expect(actualBytes).assertEqual(1048576);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_0900
     * @tc.name AppFsSpace_Routing_0079
     * @tc.desc Verify FREE_SYNC delegates last byte below GiB (1073741823) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0079';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1073741823;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1073741823; returned bytes", actualBytes, 1073741823);
          expect(actualBytes).assertEqual(1073741823);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_1000
     * @tc.name AppFsSpace_Routing_0080
     * @tc.desc Verify FREE_SYNC delegates GiB boundary (1073741824) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0080';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1073741824;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1073741824; returned bytes", actualBytes, 1073741824);
          expect(actualBytes).assertEqual(1073741824);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_1100
     * @tc.name AppFsSpace_Routing_0081
     * @tc.desc Verify FREE_SYNC delegates TiB boundary (1099511627776) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0081';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1099511627776;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC expected bytes=1099511627776; returned bytes", actualBytes, 1099511627776);
          expect(actualBytes).assertEqual(1099511627776);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_1200
     * @tc.name AppFsSpace_Routing_0082
     * @tc.desc Verify FREE_SYNC delegates PiB boundary (1125899906842624) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0082';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1125899906842624;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FREE_SYNC expected bytes=1125899906842624; returned bytes", actualBytes, 1125899906842624);
          expect(actualBytes).assertEqual(1125899906842624);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_1300
     * @tc.name AppFsSpace_Routing_0083
     * @tc.desc Verify FREE_SYNC delegates penultimate safe integer (9007199254740990) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0083';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 9007199254740990;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FREE_SYNC expected bytes=9007199254740990; returned bytes", actualBytes, 9007199254740990);
          expect(actualBytes).assertEqual(9007199254740990);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_VALID_FREE_SYNC_G1_1400
     * @tc.name AppFsSpace_Routing_0084
     * @tc.desc Verify FREE_SYNC delegates maximum safe integer (9007199254740991) without changing the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0084';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 9007199254740991;
          const actualBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name,
            "FREE_SYNC expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0100
     * @tc.name AppFsSpace_Routing_0085
     * @tc.desc Verify BUNDLE rejects negative byte count (-1) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0085';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = -1;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0200
     * @tc.name AppFsSpace_Routing_0086
     * @tc.desc Verify BUNDLE rejects negative fractional bytes (-0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0086';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = -0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0300
     * @tc.name AppFsSpace_Routing_0087
     * @tc.desc Verify BUNDLE rejects fractional bytes below one (0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0087';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0400
     * @tc.name AppFsSpace_Routing_0088
     * @tc.desc Verify BUNDLE rejects fractional bytes below KiB (1023.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0088';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1023.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0500
     * @tc.name AppFsSpace_Routing_0089
     * @tc.desc Verify BUNDLE rejects NaN byte count (Number.NaN) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0089';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0600
     * @tc.name AppFsSpace_Routing_0090
     * @tc.desc Verify BUNDLE rejects positive infinite bytes (Number.POSITIVE_INFINITY) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0090';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = Number.POSITIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0700
     * @tc.name AppFsSpace_Routing_0091
     * @tc.desc Verify BUNDLE rejects negative infinite bytes (Number.NEGATIVE_INFINITY) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0091';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = Number.NEGATIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_BUNDLE_G1_0800
     * @tc.name AppFsSpace_Routing_0092
     * @tc.desc Verify BUNDLE rejects first unsafe integer (9007199254740992) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0092';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740992;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0093
     * @tc.desc Verify FILESYSTEM_FREE rejects negative byte count (-1) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0093';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = -1;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0094
     * @tc.desc Verify FILESYSTEM_FREE rejects negative fractional bytes (-0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0094';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = -0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0095
     * @tc.desc Verify FILESYSTEM_FREE rejects fractional bytes below one (0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0095';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0400
     * @tc.name AppFsSpace_Routing_0096
     * @tc.desc Verify FILESYSTEM_FREE rejects fractional bytes below KiB (1023.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0096';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1023.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0500
     * @tc.name AppFsSpace_Routing_0097
     * @tc.desc Verify FILESYSTEM_FREE rejects NaN byte count (Number.NaN) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0097';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0600
     * @tc.name AppFsSpace_Routing_0098
     * @tc.desc Verify FILESYSTEM_FREE rejects positive infinite bytes (Number.POSITIVE_INFINITY) after only its own
     * dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0098';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.POSITIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0700
     * @tc.name AppFsSpace_Routing_0099
     * @tc.desc Verify FILESYSTEM_FREE rejects negative infinite bytes (Number.NEGATIVE_INFINITY) after only its own
     * dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0099';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NEGATIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });
  });
}
