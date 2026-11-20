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

export default function distributedSnapshot02Test(): void {
  describe('DistributedSnapshot02', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0100
     * @tc.name testDistributedFileSnapshot020001
     * @tc.desc Keep captured listeners isolated from caller edits during unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const input: DistributedCopyRequest = distributedRequest(1);
          let progressCalls: number = 0;
          let replacementCalls: number = 0;
          const originalProgress: (progress: fileIo.Progress) => void = (progress: fileIo.Progress): void => {
            progressCalls++;
            expect(progress.processedSize).assertEqual(7);
            expect(progress.totalSize).assertEqual(11);
          };
          const replacementProgress: (progress: fileIo.Progress) => void = 
            (progress: fileIo.Progress): void => { replacementCalls++; };
          const originalStatus: (networkId: string, status: number) => void = input.listeners.onStatus;
          const replacementStatus: (networkId: string, status: number) => void = (): void => { replacementCalls++; };
          input.options.progressListener = originalProgress;
          let mutationCalls: number = 0;
          api.onOperation = (phase: string): void => {
            if (phase === 'unlink') {
              mutationCalls++;
              input.listeners = { onStatus: replacementStatus };
            }
