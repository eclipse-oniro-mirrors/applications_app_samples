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

export default function distributedDescriptor04Test(): void {
  describe('DistributedDescriptor04', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0100
     * @tc.name testDistributedFileDescriptor040001
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step2WriteCount]).assertEqual(0);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0200
     * @tc.name testDistributedFileDescriptor040002
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to ordinary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step2WriteCount]).assertEqual(19);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(19);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0300
     * @tc.name testDistributedFileDescriptor040003
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = Number.MAX_SAFE_INTEGER;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step2WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0400
     * @tc.name testDistributedFileDescriptor040004
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to invalidNegative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(0);
          expect(api.closed.length - step2CloseCount).assertEqual(0);
          expect(step2Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step2Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0500
     * @tc.name testDistributedFileDescriptor040005
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to invalidFraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 0.5;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(0);
          expect(api.closed.length - step2CloseCount).assertEqual(0);
          expect(step2Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step2Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0600
     * @tc.name testDistributedFileDescriptor040006
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to openFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = step2Error;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(0);
          expect(api.closed.length - step2CloseCount).assertEqual(0);
          expect(step2Outcome.error).assertEqual(step2Error);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0700
     * @tc.name testDistributedFileDescriptor040007
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to writeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step2Error;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.descriptors[step2WriteCount]).assertEqual(7);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(7);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0800
     * @tc.name testDistributedFileDescriptor040008
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to closeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step2CloseError;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(step2CloseError);
          expect(api.descriptors[step2WriteCount]).assertEqual(7);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(7);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_0900
     * @tc.name testDistributedFileDescriptor040009
     * @tc.desc Verify descriptor lifecycle recovery from writeFailure to doubleFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step2Error;
          api.closeError = step2CloseError;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.descriptors[step2WriteCount]).assertEqual(7);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(7);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1000
     * @tc.name testDistributedFileDescriptor040010
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step2WriteCount]).assertEqual(0);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1100
     * @tc.name testDistributedFileDescriptor040011
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to ordinary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step2WriteCount]).assertEqual(19);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(19);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1200
     * @tc.name testDistributedFileDescriptor040012
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = Number.MAX_SAFE_INTEGER;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step2WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1300
     * @tc.name testDistributedFileDescriptor040013
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to invalidNegative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(0);
          expect(api.closed.length - step2CloseCount).assertEqual(0);
          expect(step2Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step2Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1400
     * @tc.name testDistributedFileDescriptor040014
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to invalidFraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 0.5;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(0);
          expect(api.closed.length - step2CloseCount).assertEqual(0);
          expect(step2Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step2Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1500
     * @tc.name testDistributedFileDescriptor040015
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to openFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = step2Error;
          api.writeError = undefined;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(0);
          expect(api.closed.length - step2CloseCount).assertEqual(0);
          expect(step2Outcome.error).assertEqual(step2Error);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1600
     * @tc.name testDistributedFileDescriptor040016
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to writeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step2Error;
          api.closeError = undefined;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.descriptors[step2WriteCount]).assertEqual(7);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(7);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1700
     * @tc.name testDistributedFileDescriptor040017
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to closeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step2CloseError;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(step2CloseError);
          expect(api.descriptors[step2WriteCount]).assertEqual(7);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(7);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR04_1800
     * @tc.name testDistributedFileDescriptor040018
     * @tc.desc Verify descriptor lifecycle recovery from closeFailure to doubleFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor040018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(step1CloseError);
          expect(api.descriptors[step1WriteCount]).assertEqual(7);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(7);
          const step2Error: Error = new Error('primary step 2');
          const step2CloseError: Error = new Error('release step 2');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step2Error;
          api.closeError = step2CloseError;
          const step2EventCount: number = api.events.length;
          const step2PathCount: number = api.paths.length;
          const step2WriteCount: number = api.descriptors.length;
          const step2CloseCount: number = api.closed.length;
          const step2Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-2.txt ', 'payload-2', api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step2PathCount).assertEqual(1);
          expect(api.paths[step2PathCount]).assertEqual('/sandbox/file-2.txt');
          expect(api.descriptors.length - step2WriteCount).assertEqual(1);
          expect(api.closed.length - step2CloseCount).assertEqual(1);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.descriptors[step2WriteCount]).assertEqual(7);
          expect(api.contents[step2WriteCount]).assertEqual('payload-2');
          expect(api.closed[step2CloseCount]).assertEqual(7);
        } finally {
          console.info(`${TAG} end`);
        }
      });

  });
}
