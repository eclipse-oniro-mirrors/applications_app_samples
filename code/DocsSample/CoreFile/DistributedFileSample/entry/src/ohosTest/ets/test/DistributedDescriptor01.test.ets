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

export default function distributedDescriptor01Test(): void {
  describe('DistributedDescriptor01', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0100
     * @tc.name testDistributedFileDescriptor010001
     * @tc.desc Verify descriptor lifecycle recovery from zero to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0200
     * @tc.name testDistributedFileDescriptor010002
     * @tc.desc Verify descriptor lifecycle recovery from zero to ordinary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0300
     * @tc.name testDistributedFileDescriptor010003
     * @tc.desc Verify descriptor lifecycle recovery from zero to maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0400
     * @tc.name testDistributedFileDescriptor010004
     * @tc.desc Verify descriptor lifecycle recovery from zero to invalidNegative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0500
     * @tc.name testDistributedFileDescriptor010005
     * @tc.desc Verify descriptor lifecycle recovery from zero to invalidFraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0600
     * @tc.name testDistributedFileDescriptor010006
     * @tc.desc Verify descriptor lifecycle recovery from zero to openFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0700
     * @tc.name testDistributedFileDescriptor010007
     * @tc.desc Verify descriptor lifecycle recovery from zero to writeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0800
     * @tc.name testDistributedFileDescriptor010008
     * @tc.desc Verify descriptor lifecycle recovery from zero to closeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_0900
     * @tc.name testDistributedFileDescriptor010009
     * @tc.desc Verify descriptor lifecycle recovery from zero to doubleFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 0;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(0);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(0);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1000
     * @tc.name testDistributedFileDescriptor010010
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1100
     * @tc.name testDistributedFileDescriptor010011
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to ordinary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1200
     * @tc.name testDistributedFileDescriptor010012
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1300
     * @tc.name testDistributedFileDescriptor010013
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to invalidNegative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1400
     * @tc.name testDistributedFileDescriptor010014
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to invalidFraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1500
     * @tc.name testDistributedFileDescriptor010015
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to openFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1600
     * @tc.name testDistributedFileDescriptor010016
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to writeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1700
     * @tc.name testDistributedFileDescriptor010017
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to closeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR01_1800
     * @tc.name testDistributedFileDescriptor010018
     * @tc.desc Verify descriptor lifecycle recovery from ordinary to doubleFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor010018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 19;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(false);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open|write|close');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(1);
          expect(api.closed.length - step1CloseCount).assertEqual(1);
          expect(step1Outcome.error).assertEqual(undefined);
          expect(api.descriptors[step1WriteCount]).assertEqual(19);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(19);
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
