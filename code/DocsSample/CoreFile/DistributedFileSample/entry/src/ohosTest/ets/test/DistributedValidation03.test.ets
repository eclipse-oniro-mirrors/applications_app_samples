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

export default function distributedValidation03Test(): void {
  describe('DistributedValidation03', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION03_0100
     * @tc.name testDistributedFileValidation030001
     * @tc.desc Reject descriptor path whitespace form 7 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation030001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' ', 'payload', api));
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
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION03_0200
     * @tc.name testDistributedFileValidation030002
     * @tc.desc Reject descriptor path whitespace form 8 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation030002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile(' ', 'payload', api));
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
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION03_0300
     * @tc.name testDistributedFileValidation030003
     * @tc.desc Reject descriptor path whitespace form 9 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation030003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile('\u2028', 'payload', api));
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
     * @tc.number SUB_DISTRIBUTED_FILE_VALIDATION03_0400
     * @tc.name testDistributedFileValidation030004
     * @tc.desc Reject descriptor path whitespace form 10 before open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileValidation030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileValidation030004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const outcome: DistributedOutcome = captureDescriptor(
            (): void => writeTextFile('﻿', 'payload', api));
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
