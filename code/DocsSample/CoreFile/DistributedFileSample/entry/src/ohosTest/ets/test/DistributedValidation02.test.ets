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

export default function distributedValidation02Test(): void {
  describe('DistributedValidation02', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0100
     * @tc.name testDistributedFileValidation020001
     * @tc.desc Reject destinationPath whitespace form 9 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = '\u2028';
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
          expect(input.destinationPath).assertEqual('\u2028');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0200
     * @tc.name testDistributedFileValidation020002
     * @tc.desc Reject destinationPath whitespace form 10 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.destinationPath = '﻿';
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
          expect(input.destinationPath).assertEqual('﻿');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0300
     * @tc.name testDistributedFileValidation020003
     * @tc.desc Reject networkId whitespace form 1 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = '';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual('');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0400
     * @tc.name testDistributedFileValidation020004
     * @tc.desc Reject networkId whitespace form 2 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0500
     * @tc.name testDistributedFileValidation020005
     * @tc.desc Reject networkId whitespace form 3 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = '\t';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual('\t');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0600
     * @tc.name testDistributedFileValidation020006
     * @tc.desc Reject networkId whitespace form 4 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = '\n';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual('\n');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0700
     * @tc.name testDistributedFileValidation020007
     * @tc.desc Reject networkId whitespace form 5 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = '\r\n';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual('\r\n');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0800
     * @tc.name testDistributedFileValidation020008
     * @tc.desc Reject networkId whitespace form 6 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = ' \t\r\n ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual(' \t\r\n ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_0900
     * @tc.name testDistributedFileValidation020009
     * @tc.desc Reject networkId whitespace form 7 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1000
     * @tc.name testDistributedFileValidation020010
     * @tc.desc Reject networkId whitespace form 8 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = ' ';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual(' ');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1100
     * @tc.name testDistributedFileValidation020011
     * @tc.desc Reject networkId whitespace form 9 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = '\u2028';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual('\u2028');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1200
     * @tc.name testDistributedFileValidation020012
     * @tc.desc Reject networkId whitespace form 10 before URI conversion or connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          input.networkId = '﻿';
          const outcome: DistributedOutcome = 
            await captureDistributed((): Promise<void> => copyFromDistributed(input, api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('Network ID must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.uriPaths.length).assertEqual(0);
          expect(api.networks.length).assertEqual(0);
          expect(api.sources.length).assertEqual(0);
          expect(api.removed.length).assertEqual(0);
          expect(api.disconnected.length).assertEqual(0);
          expect(input.networkId).assertEqual('﻿');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1300
     * @tc.name testDistributedFileValidation020013
     * @tc.desc Reject descriptor path whitespace form 1 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile('', 'payload', api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('File path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.paths.length).assertEqual(0);
          expect(api.descriptors.length).assertEqual(0);
          expect(api.closed.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1400
     * @tc.name testDistributedFileValidation020014
     * @tc.desc Reject descriptor path whitespace form 2 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' ', 'payload', api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('File path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.paths.length).assertEqual(0);
          expect(api.descriptors.length).assertEqual(0);
          expect(api.closed.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1500
     * @tc.name testDistributedFileValidation020015
     * @tc.desc Reject descriptor path whitespace form 3 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile('\t', 'payload', api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('File path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.paths.length).assertEqual(0);
          expect(api.descriptors.length).assertEqual(0);
          expect(api.closed.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1600
     * @tc.name testDistributedFileValidation020016
     * @tc.desc Reject descriptor path whitespace form 4 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile('\n', 'payload', api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('File path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.paths.length).assertEqual(0);
          expect(api.descriptors.length).assertEqual(0);
          expect(api.closed.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1700
     * @tc.name testDistributedFileValidation020017
     * @tc.desc Reject descriptor path whitespace form 5 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile('\r\n', 'payload', api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('File path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.paths.length).assertEqual(0);
          expect(api.descriptors.length).assertEqual(0);
          expect(api.closed.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION02_1800
     * @tc.name testDistributedFileValidation020018
     * @tc.desc Reject descriptor path whitespace form 6 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation020018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' \t\r\n ', 'payload', api));
          expect(outcome.threw).assertEqual(true);
          expect(outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(outcome.error?.message).assertEqual('File path must not be empty');
          expect(api.events.length).assertEqual(0);
          expect(api.paths.length).assertEqual(0);
          expect(api.descriptors.length).assertEqual(0);
          expect(api.closed.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

  });
}
