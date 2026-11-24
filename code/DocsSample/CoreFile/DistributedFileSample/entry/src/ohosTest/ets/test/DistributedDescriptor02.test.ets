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

export default function distributedDescriptor02Test(): void {
  describe('DistributedDescriptor02', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0100
     * @tc.name testDistributedFileDescriptor020001
     * @tc.desc Verify descriptor lifecycle recovery from maximum to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0200
     * @tc.name testDistributedFileDescriptor020002
     * @tc.desc Verify descriptor lifecycle recovery from maximum to ordinary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0300
     * @tc.name testDistributedFileDescriptor020003
     * @tc.desc Verify descriptor lifecycle recovery from maximum to maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0400
     * @tc.name testDistributedFileDescriptor020004
     * @tc.desc Verify descriptor lifecycle recovery from maximum to invalidNegative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0500
     * @tc.name testDistributedFileDescriptor020005
     * @tc.desc Verify descriptor lifecycle recovery from maximum to invalidFraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0600
     * @tc.name testDistributedFileDescriptor020006
     * @tc.desc Verify descriptor lifecycle recovery from maximum to openFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0700
     * @tc.name testDistributedFileDescriptor020007
     * @tc.desc Verify descriptor lifecycle recovery from maximum to writeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0800
     * @tc.name testDistributedFileDescriptor020008
     * @tc.desc Verify descriptor lifecycle recovery from maximum to closeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_0900
     * @tc.name testDistributedFileDescriptor020009
     * @tc.desc Verify descriptor lifecycle recovery from maximum to doubleFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = Number.MAX_SAFE_INTEGER;
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
          expect(api.descriptors[step1WriteCount]).assertEqual(Number.MAX_SAFE_INTEGER);
          expect(api.contents[step1WriteCount]).assertEqual('payload-1');
          expect(api.closed[step1CloseCount]).assertEqual(Number.MAX_SAFE_INTEGER);
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1000
     * @tc.name testDistributedFileDescriptor020010
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1100
     * @tc.name testDistributedFileDescriptor020011
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to ordinary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1200
     * @tc.name testDistributedFileDescriptor020012
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1300
     * @tc.name testDistributedFileDescriptor020013
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to invalidNegative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1400
     * @tc.name testDistributedFileDescriptor020014
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to invalidFraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1500
     * @tc.name testDistributedFileDescriptor020015
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to openFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1600
     * @tc.name testDistributedFileDescriptor020016
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to writeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1700
     * @tc.name testDistributedFileDescriptor020017
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to closeFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR02_1800
     * @tc.name testDistributedFileDescriptor020018
     * @tc.desc Verify descriptor lifecycle recovery from invalidNegative to doubleFailure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor020018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = -1;
          api.openError = undefined;
          api.writeError = undefined;
          api.closeError = undefined;
          const step1EventCount: number = api.events.length;
          const step1PathCount: number = api.paths.length;
          const step1WriteCount: number = api.descriptors.length;
          const step1CloseCount: number = api.closed.length;
          const step1Outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' /sandbox/file-1.txt ', 'payload-1', api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('open');
          expect(api.paths.length - step1PathCount).assertEqual(1);
          expect(api.paths[step1PathCount]).assertEqual('/sandbox/file-1.txt');
          expect(api.descriptors.length - step1WriteCount).assertEqual(0);
          expect(api.closed.length - step1CloseCount).assertEqual(0);
          expect(step1Outcome.error?.name).assertEqual('InvalidFileRequestError');
          expect(step1Outcome.error?.message).assertEqual('File descriptor must be a nonnegative safe integer');
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
