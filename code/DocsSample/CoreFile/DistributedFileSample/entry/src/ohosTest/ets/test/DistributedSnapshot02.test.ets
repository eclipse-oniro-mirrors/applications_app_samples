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
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.listeners.onStatus).assertEqual(replacementStatus);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0200
     * @tc.name testDistributedFileSnapshot020002
     * @tc.desc Keep captured options isolated from caller edits during unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020002';
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
              input.options = { progressListener: replacementProgress };
            }
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.options.progressListener).assertEqual(replacementProgress);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0300
     * @tc.name testDistributedFileSnapshot020003
     * @tc.desc Keep captured sourcePath isolated from caller edits during disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020003';
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
            if (phase === 'disconnect') {
              mutationCalls++;
              input.sourcePath = '/changed/sourcePath';
            }
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.sourcePath).assertEqual('/changed/sourcePath');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0400
     * @tc.name testDistributedFileSnapshot020004
     * @tc.desc Keep captured destinationPath isolated from caller edits during disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020004';
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
            if (phase === 'disconnect') {
              mutationCalls++;
              input.destinationPath = '/changed/destinationPath';
            }
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.destinationPath).assertEqual('/changed/destinationPath');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0500
     * @tc.name testDistributedFileSnapshot020005
     * @tc.desc Keep captured networkId isolated from caller edits during disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020005';
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
            if (phase === 'disconnect') {
              mutationCalls++;
              input.networkId = 'changed-peer';
            }
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.networkId).assertEqual('changed-peer');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0600
     * @tc.name testDistributedFileSnapshot020006
     * @tc.desc Keep captured listeners isolated from caller edits during disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020006';
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
            if (phase === 'disconnect') {
              mutationCalls++;
              input.listeners = { onStatus: replacementStatus };
            }
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.listeners.onStatus).assertEqual(replacementStatus);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT02_0700
     * @tc.name testDistributedFileSnapshot020007
     * @tc.desc Keep captured options isolated from caller edits during disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot020007';
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
            if (phase === 'disconnect') {
              mutationCalls++;
              input.options = { progressListener: replacementProgress };
            }
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          const outcome: DistributedOutcome = await captureDistributed((): Promise<void> => pending);
          expect(outcome.threw).assertEqual(false);
          expect(outcome.error).assertEqual(undefined);
          expect(mutationCalls).assertEqual(1);
          expect(progressCalls).assertEqual(1);
          expect(replacementCalls).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.join('|')).assertEqual('/distributed/source-1.txt|/sandbox/destination-1.txt');
          expect(api.networks[0]).assertEqual('peer-1');
          expect(api.disconnected[0]).assertEqual('peer-1');
          expect(api.sources[0]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[0]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.removed[0]).assertEqual('/distributed/source-1.txt');
          expect(api.listeners[0].onStatus).assertEqual(originalStatus);
          expect(api.options[0].progressListener).assertEqual(originalProgress);
          expect(api.options[0].copySignal).assertEqual(undefined);
          expect(input.options.progressListener).assertEqual(replacementProgress);
        } finally {
          console.info(`${TAG} end`);
        }
      });

  });
}
