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

export default function distributedSequence26Test(): void {
  describe('DistributedSequence26', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0100
     * @tc.name testDistributedFileSequence260001
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, success, destinationUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('success step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          expect(api.networks[step2NetworkCount]).assertEqual('peer-2');
          expect(api.listeners[step2NetworkCount] === step2Request.listeners).assertEqual(false);
          expect(api.listeners[step2NetworkCount].onStatus).assertEqual(step2Request.listeners.onStatus);
          expect(api.sources[step2CopyCount]).assertEqual('mock:/distributed/source-2.txt');
          expect(api.destinations[step2CopyCount]).assertEqual('mock:/sandbox/destination-2.txt');
          expect(api.options[step2CopyCount] === step2Request.options).assertEqual(false);
          expect(api.options[step2CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step2CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step2ReleaseCount]).assertEqual('peer-2');
          expect(api.removed[step2RemovedCount]).assertEqual('/distributed/source-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('destinationUri step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step3Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(0);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|connect|copy|unlink|disconnect|uri|u' +
            'ri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0200
     * @tc.name testDistributedFileSequence260002
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, success, connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('success step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          expect(api.networks[step2NetworkCount]).assertEqual('peer-2');
          expect(api.listeners[step2NetworkCount] === step2Request.listeners).assertEqual(false);
          expect(api.listeners[step2NetworkCount].onStatus).assertEqual(step2Request.listeners.onStatus);
          expect(api.sources[step2CopyCount]).assertEqual('mock:/distributed/source-2.txt');
          expect(api.destinations[step2CopyCount]).assertEqual('mock:/sandbox/destination-2.txt');
          expect(api.options[step2CopyCount] === step2Request.options).assertEqual(false);
          expect(api.options[step2CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step2CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step2ReleaseCount]).assertEqual('peer-2');
          expect(api.removed[step2RemovedCount]).assertEqual('/distributed/source-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('connect step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = step3Error;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|connect|copy|unlink|disconnect|uri|u' +
            'ri|connect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0300
     * @tc.name testDistributedFileSequence260003
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, success, copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('success step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          expect(api.networks[step2NetworkCount]).assertEqual('peer-2');
          expect(api.listeners[step2NetworkCount] === step2Request.listeners).assertEqual(false);
          expect(api.listeners[step2NetworkCount].onStatus).assertEqual(step2Request.listeners.onStatus);
          expect(api.sources[step2CopyCount]).assertEqual('mock:/distributed/source-2.txt');
          expect(api.destinations[step2CopyCount]).assertEqual('mock:/sandbox/destination-2.txt');
          expect(api.options[step2CopyCount] === step2Request.options).assertEqual(false);
          expect(api.options[step2CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step2CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step2ReleaseCount]).assertEqual('peer-2');
          expect(api.removed[step2RemovedCount]).assertEqual('/distributed/source-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('copy step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step3Error;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|connect|copy|unlink|disconnect|uri|u' +
            'ri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0400
     * @tc.name testDistributedFileSequence260004
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, success, unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('success step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          expect(api.networks[step2NetworkCount]).assertEqual('peer-2');
          expect(api.listeners[step2NetworkCount] === step2Request.listeners).assertEqual(false);
          expect(api.listeners[step2NetworkCount].onStatus).assertEqual(step2Request.listeners.onStatus);
          expect(api.sources[step2CopyCount]).assertEqual('mock:/distributed/source-2.txt');
          expect(api.destinations[step2CopyCount]).assertEqual('mock:/sandbox/destination-2.txt');
          expect(api.options[step2CopyCount] === step2Request.options).assertEqual(false);
          expect(api.options[step2CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step2CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step2ReleaseCount]).assertEqual('peer-2');
          expect(api.removed[step2RemovedCount]).assertEqual('/distributed/source-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('unlink step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step3Error;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.removed[step3RemovedCount]).assertEqual('/distributed/source-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|connect|copy|unlink|disconnect|uri|u' +
            'ri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0500
     * @tc.name testDistributedFileSequence260005
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, success, disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('success step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          expect(api.networks[step2NetworkCount]).assertEqual('peer-2');
          expect(api.listeners[step2NetworkCount] === step2Request.listeners).assertEqual(false);
          expect(api.listeners[step2NetworkCount].onStatus).assertEqual(step2Request.listeners.onStatus);
          expect(api.sources[step2CopyCount]).assertEqual('mock:/distributed/source-2.txt');
          expect(api.destinations[step2CopyCount]).assertEqual('mock:/sandbox/destination-2.txt');
          expect(api.options[step2CopyCount] === step2Request.options).assertEqual(false);
          expect(api.options[step2CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step2CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step2ReleaseCount]).assertEqual('peer-2');
          expect(api.removed[step2RemovedCount]).assertEqual('/distributed/source-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('disconnect step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = step3ReleaseError;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3ReleaseError);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.removed[step3RemovedCount]).assertEqual('/distributed/source-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|connect|copy|unlink|disconnect|uri|u' +
            'ri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0600
     * @tc.name testDistributedFileSequence260006
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, success, copyAndDisconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('success step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(false);
          expect(step2Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          expect(api.networks[step2NetworkCount]).assertEqual('peer-2');
          expect(api.listeners[step2NetworkCount] === step2Request.listeners).assertEqual(false);
          expect(api.listeners[step2NetworkCount].onStatus).assertEqual(step2Request.listeners.onStatus);
          expect(api.sources[step2CopyCount]).assertEqual('mock:/distributed/source-2.txt');
          expect(api.destinations[step2CopyCount]).assertEqual('mock:/sandbox/destination-2.txt');
          expect(api.options[step2CopyCount] === step2Request.options).assertEqual(false);
          expect(api.options[step2CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step2CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step2ReleaseCount]).assertEqual('peer-2');
          expect(api.removed[step2RemovedCount]).assertEqual('/distributed/source-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('copyAndDisconnect step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step3Error;
          api.unlinkError = undefined;
          api.disconnectError = step3ReleaseError;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|connect|copy|unlink|disconnect|uri|u' +
            'ri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0700
     * @tc.name testDistributedFileSequence260007
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('success step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(false);
          expect(step3Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.removed[step3RemovedCount]).assertEqual('/distributed/source-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|uri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0800
     * @tc.name testDistributedFileSequence260008
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, sourceUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('sourceUri step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step3Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step3UriCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(0);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|disconnect|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_0900
     * @tc.name testDistributedFileSequence260009
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, destinationUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('destinationUri step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step3Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(0);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|disconnect|uri|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1000
     * @tc.name testDistributedFileSequence260010
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('connect step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = step3Error;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|disconnect|uri|uri|uri|connect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1100
     * @tc.name testDistributedFileSequence260011
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('copy step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step3Error;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|uri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1200
     * @tc.name testDistributedFileSequence260012
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('unlink step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step3Error;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.removed[step3RemovedCount]).assertEqual('/distributed/source-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|uri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1300
     * @tc.name testDistributedFileSequence260013
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('disconnect step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = step3ReleaseError;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3ReleaseError);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.removed[step3RemovedCount]).assertEqual('/distributed/source-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|uri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1400
     * @tc.name testDistributedFileSequence260014
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, sourceUri, copyAndDisconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('sourceUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(1);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('copyAndDisconnect step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step3Error;
          api.unlinkError = undefined;
          api.disconnectError = step3ReleaseError;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|uri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1500
     * @tc.name testDistributedFileSequence260015
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, destinationUri, success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('destinationUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('success step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(false);
          expect(step3Outcome.error).assertEqual(undefined);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(1);
          expect(api.sources.length - step3CopyCount).assertEqual(1);
          expect(api.removed.length - step3RemovedCount).assertEqual(1);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.networks[step3NetworkCount]).assertEqual('peer-3');
          expect(api.listeners[step3NetworkCount] === step3Request.listeners).assertEqual(false);
          expect(api.listeners[step3NetworkCount].onStatus).assertEqual(step3Request.listeners.onStatus);
          expect(api.sources[step3CopyCount]).assertEqual('mock:/distributed/source-3.txt');
          expect(api.destinations[step3CopyCount]).assertEqual('mock:/sandbox/destination-3.txt');
          expect(api.options[step3CopyCount] === step3Request.options).assertEqual(false);
          expect(api.options[step3CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step3CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step3ReleaseCount]).assertEqual('peer-3');
          expect(api.removed[step3RemovedCount]).assertEqual('/distributed/source-3.txt');
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|disconnect|uri|uri|uri|uri|connect|copy|unlink|disconne' +
            'ct');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1600
     * @tc.name testDistributedFileSequence260016
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, destinationUri, sourceUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('destinationUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('sourceUri step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 1;
          api.uriError = step3Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri');
          expect(api.uriPaths.length - step3UriCount).assertEqual(1);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(0);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|disconnect|uri|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1700
     * @tc.name testDistributedFileSequence260017
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, destinationUri, destinationUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('destinationUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step2Request, api));
          expect(step2Outcome.threw).assertEqual(true);
          expect(step2Outcome.error).assertEqual(step2Error);
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(0);
          expect(api.sources.length - step2CopyCount).assertEqual(0);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step2ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step2UriCount + 1]).assertEqual('/sandbox/destination-2.txt');
          const step3Request: DistributedCopyRequest = distributedRequest(3);
          const step3Error: Error = new Error('destinationUri step 3');
          const step3ReleaseError: Error = new Error('release step 3');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step3Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step3EventCount: number = api.events.length;
          const step3UriCount: number = api.uriPaths.length;
          const step3NetworkCount: number = api.networks.length;
          const step3CopyCount: number = api.sources.length;
          const step3RemovedCount: number = api.removed.length;
          const step3ReleaseCount: number = api.disconnected.length;
          const step3Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step3Request, api));
          expect(step3Outcome.threw).assertEqual(true);
          expect(step3Outcome.error).assertEqual(step3Error);
          expect(api.events.slice(step3EventCount).join('|')).assertEqual('uri|uri');
          expect(api.uriPaths.length - step3UriCount).assertEqual(2);
          expect(api.uriPaths[step3UriCount]).assertEqual('/distributed/source-3.txt');
          expect(api.networks.length - step3NetworkCount).assertEqual(0);
          expect(api.sources.length - step3CopyCount).assertEqual(0);
          expect(api.removed.length - step3RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step3ReleaseCount).assertEqual(0);
          expect(api.uriPaths[step3UriCount + 1]).assertEqual('/sandbox/destination-3.txt');
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|disconnect|uri|uri|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE26_1800
     * @tc.name testDistributedFileSequence260018
     * @tc.desc Verify isolated three-copy recovery sequence copyAndDisconnect, destinationUri, connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence260018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence260018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('copyAndDisconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step1Error;
          api.unlinkError = undefined;
          api.disconnectError = step1ReleaseError;
          const step1EventCount: number = api.events.length;
          const step1UriCount: number = api.uriPaths.length;
          const step1NetworkCount: number = api.networks.length;
          const step1CopyCount: number = api.sources.length;
          const step1RemovedCount: number = api.removed.length;
          const step1ReleaseCount: number = api.disconnected.length;
          const step1Outcome: DistributedOutcome = await captureDistributed(
            (): Promise<void> => copyFromDistributed(step1Request, api));
          expect(step1Outcome.threw).assertEqual(true);
          expect(step1Outcome.error).assertEqual(step1Error);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(0);
          expect(api.disconnected.length - step1ReleaseCount).assertEqual(1);
          expect(api.uriPaths[step1UriCount + 1]).assertEqual('/sandbox/destination-1.txt');
          expect(api.networks[step1NetworkCount]).assertEqual('peer-1');
          expect(api.listeners[step1NetworkCount] === step1Request.listeners).assertEqual(false);
          expect(api.listeners[step1NetworkCount].onStatus).assertEqual(step1Request.listeners.onStatus);
          expect(api.sources[step1CopyCount]).assertEqual('mock:/distributed/source-1.txt');
          expect(api.destinations[step1CopyCount]).assertEqual('mock:/sandbox/destination-1.txt');
          expect(api.options[step1CopyCount] === step1Request.options).assertEqual(false);
          expect(api.options[step1CopyCount].progressListener).assertEqual(undefined);
          expect(api.options[step1CopyCount].copySignal).assertEqual(undefined);
          expect(api.disconnected[step1ReleaseCount]).assertEqual('peer-1');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('destinationUri step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 2;
          api.uriError = step2Error;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = undefined;
          api.disconnectError = undefined;
          const step2EventCount: number = api.events.length;
          const step2UriCount: number = api.uriPaths.length;
          const step2NetworkCount: number = api.networks.length;
          const step2CopyCount: number = api.sources.length;
          const step2RemovedCount: number = api.removed.length;
          const step2ReleaseCount: number = api.disconnected.length;
          const step2Outcome: DistributedOutcome = await captureDistributed(
