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

import type { fileIo } from '@kit.CoreFileKit';
import { describe, it, TestType, Size, Level } from '@ohos/hypium';
import { copyFromDistributed, writeTextFile } from '../../../main/ets/model/DistributedCopy';
import type { DistributedCopyRequest } from '../../../main/ets/model/DistributedCopy';
import {
  expect, captureDistributed, captureDescriptor, distributedRequest, RecordingDistributedApi, RecordingDescriptorApi
} from './DistributedTestSupport';
import type { DistributedOutcome } from './DistributedTestSupport';

export default function distributedValidation01Test(): void {
  describe('DistributedValidation01', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0100
     * @tc.name testDistributedFileValidation010001
     * @tc.desc Reject sourcePath whitespace form 1 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = '';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual('');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0200
     * @tc.name testDistributedFileValidation010002
     * @tc.desc Reject sourcePath whitespace form 2 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0300
     * @tc.name testDistributedFileValidation010003
     * @tc.desc Reject sourcePath whitespace form 3 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = '\t';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual('\t');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0400
     * @tc.name testDistributedFileValidation010004
     * @tc.desc Reject sourcePath whitespace form 4 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = '\n';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual('\n');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0500
     * @tc.name testDistributedFileValidation010005
     * @tc.desc Reject sourcePath whitespace form 5 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = '\r\n';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual('\r\n');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0600
     * @tc.name testDistributedFileValidation010006
     * @tc.desc Reject sourcePath whitespace form 6 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = ' \t\r\n ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual(' \t\r\n ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0700
     * @tc.name testDistributedFileValidation010007
     * @tc.desc Reject sourcePath whitespace form 7 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0800
     * @tc.name testDistributedFileValidation010008
     * @tc.desc Reject sourcePath whitespace form 8 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_0900
     * @tc.name testDistributedFileValidation010009
     * @tc.desc Reject sourcePath whitespace form 9 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = '\u2028';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual('\u2028');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1000
     * @tc.name testDistributedFileValidation010010
     * @tc.desc Reject sourcePath whitespace form 10 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.sourcePath = '﻿';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Source path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.sourcePath).assertEqual('﻿');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1100
     * @tc.name testDistributedFileValidation010011
     * @tc.desc Reject destinationPath whitespace form 1 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = '';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual('');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1200
     * @tc.name testDistributedFileValidation010012
     * @tc.desc Reject destinationPath whitespace form 2 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1300
     * @tc.name testDistributedFileValidation010013
     * @tc.desc Reject destinationPath whitespace form 3 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = '\t';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual('\t');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1400
     * @tc.name testDistributedFileValidation010014
     * @tc.desc Reject destinationPath whitespace form 4 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = '\n';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual('\n');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1500
     * @tc.name testDistributedFileValidation010015
     * @tc.desc Reject destinationPath whitespace form 5 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = '\r\n';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual('\r\n');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1600
     * @tc.name testDistributedFileValidation010016
     * @tc.desc Reject destinationPath whitespace form 6 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = ' \t\r\n ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual(' \t\r\n ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1700
     * @tc.name testDistributedFileValidation010017
     * @tc.desc Reject destinationPath whitespace form 7 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION01_1800
     * @tc.name testDistributedFileValidation010018
     * @tc.desc Reject destinationPath whitespace form 8 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation010018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Destination path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.destinationPath).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

  });
}
