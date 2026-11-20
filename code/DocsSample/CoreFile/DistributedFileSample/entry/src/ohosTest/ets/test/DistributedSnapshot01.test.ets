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

export default function distributedSnapshot01Test(): void {
  describe('DistributedSnapshot01', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0100
     * @tc.name testDistributedFileSnapshot010001
     * @tc.desc Keep captured sourcePath isolated from caller edits during pending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010001';
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
          const pending: Promise<void> = copyFromDistributed(input, api);
          mutationCalls++;
          input.sourcePath = '/changed/sourcePath';
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0200
     * @tc.name testDistributedFileSnapshot010002
     * @tc.desc Keep captured destinationPath isolated from caller edits during pending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010002';
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
          const pending: Promise<void> = copyFromDistributed(input, api);
          mutationCalls++;
          input.destinationPath = '/changed/destinationPath';
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0300
     * @tc.name testDistributedFileSnapshot010003
     * @tc.desc Keep captured networkId isolated from caller edits during pending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010003';
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
          const pending: Promise<void> = copyFromDistributed(input, api);
          mutationCalls++;
          input.networkId = 'changed-peer';
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0400
     * @tc.name testDistributedFileSnapshot010004
     * @tc.desc Keep captured listeners isolated from caller edits during pending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010004';
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
          const pending: Promise<void> = copyFromDistributed(input, api);
          mutationCalls++;
          input.listeners = { onStatus: replacementStatus };
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0500
     * @tc.name testDistributedFileSnapshot010005
     * @tc.desc Keep captured options isolated from caller edits during pending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010005';
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
          const pending: Promise<void> = copyFromDistributed(input, api);
          mutationCalls++;
          input.options = { progressListener: replacementProgress };
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0600
     * @tc.name testDistributedFileSnapshot010006
     * @tc.desc Keep captured sourcePath isolated from caller edits during connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010006';
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
            if (phase === 'connect') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0700
     * @tc.name testDistributedFileSnapshot010007
     * @tc.desc Keep captured destinationPath isolated from caller edits during connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010007';
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
            if (phase === 'connect') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0800
     * @tc.name testDistributedFileSnapshot010008
     * @tc.desc Keep captured networkId isolated from caller edits during connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010008';
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
            if (phase === 'connect') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_0900
     * @tc.name testDistributedFileSnapshot010009
     * @tc.desc Keep captured listeners isolated from caller edits during connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010009';
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
            if (phase === 'connect') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1000
     * @tc.name testDistributedFileSnapshot010010
     * @tc.desc Keep captured options isolated from caller edits during connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010010';
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
            if (phase === 'connect') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1100
     * @tc.name testDistributedFileSnapshot010011
     * @tc.desc Keep captured sourcePath isolated from caller edits during copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010011';
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
            if (phase === 'copy') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1200
     * @tc.name testDistributedFileSnapshot010012
     * @tc.desc Keep captured destinationPath isolated from caller edits during copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010012';
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
            if (phase === 'copy') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1300
     * @tc.name testDistributedFileSnapshot010013
     * @tc.desc Keep captured networkId isolated from caller edits during copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010013';
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
            if (phase === 'copy') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1400
     * @tc.name testDistributedFileSnapshot010014
     * @tc.desc Keep captured listeners isolated from caller edits during copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010014';
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
            if (phase === 'copy') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1500
     * @tc.name testDistributedFileSnapshot010015
     * @tc.desc Keep captured options isolated from caller edits during copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010015';
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
            if (phase === 'copy') {
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1600
     * @tc.name testDistributedFileSnapshot010016
     * @tc.desc Keep captured sourcePath isolated from caller edits during unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010016';
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1700
     * @tc.name testDistributedFileSnapshot010017
     * @tc.desc Keep captured destinationPath isolated from caller edits during unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010017';
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
     * @tc.number SUB_DISTRIBUTED_FILE_SNAPSHOT01_1800
     * @tc.name testDistributedFileSnapshot010018
     * @tc.desc Keep captured networkId isolated from caller edits during unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSnapshot010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSnapshot010018';
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

  });
}
