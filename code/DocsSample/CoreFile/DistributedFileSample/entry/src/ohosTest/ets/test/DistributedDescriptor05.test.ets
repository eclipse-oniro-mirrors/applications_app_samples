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

export default function distributedDescriptor05Test(): void {
  describe('DistributedDescriptor05', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_DESCRIPTOR05_0100
     * @tc.name testDistributedFileDescriptor050001
     * @tc.desc Verify descriptor lifecycle recovery from doubleFailure to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileDescriptor050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileDescriptor050001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDescriptorApi = new RecordingDescriptorApi();
          const step1Error: Error = new Error('primary step 1');
          const step1CloseError: Error = new Error('release step 1');
          api.fd = 7;
          api.openError = undefined;
          api.writeError = step1Error;
          api.closeError = step1CloseError;
          const step1EventCount: number = api.events.length;
