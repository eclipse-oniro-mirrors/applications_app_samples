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

export default function distributedSequence22Test(): void {
  describe('DistributedSequence22', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0100
     * @tc.name testDistributedFileSequence220001
     * @tc.desc Verify isolated three-copy recovery sequence unlink, copyAndDisconnect, destinationUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220001';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('unlink step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step1Error;
          api.disconnectError = undefined;
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
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('copyAndDisconnect step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step2Error;
          api.unlinkError = undefined;
          api.disconnectError = step2ReleaseError;
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
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|disconnect|uri|u' +
            'ri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0200
     * @tc.name testDistributedFileSequence220002
     * @tc.desc Verify isolated three-copy recovery sequence unlink, copyAndDisconnect, connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220002';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('unlink step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step1Error;
          api.disconnectError = undefined;
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
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('copyAndDisconnect step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step2Error;
          api.unlinkError = undefined;
          api.disconnectError = step2ReleaseError;
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
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|disconnect|uri|u' +
            'ri|connect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0300
     * @tc.name testDistributedFileSequence220003
     * @tc.desc Verify isolated three-copy recovery sequence unlink, copyAndDisconnect, copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220003';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('unlink step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step1Error;
          api.disconnectError = undefined;
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
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('copyAndDisconnect step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step2Error;
          api.unlinkError = undefined;
          api.disconnectError = step2ReleaseError;
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
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|disconnect|uri|u' +
            'ri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0400
     * @tc.name testDistributedFileSequence220004
     * @tc.desc Verify isolated three-copy recovery sequence unlink, copyAndDisconnect, unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220004';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('unlink step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step1Error;
          api.disconnectError = undefined;
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
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('copyAndDisconnect step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step2Error;
          api.unlinkError = undefined;
          api.disconnectError = step2ReleaseError;
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
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|disconnect|uri|u' +
            'ri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0500
     * @tc.name testDistributedFileSequence220005
     * @tc.desc Verify isolated three-copy recovery sequence unlink, copyAndDisconnect, disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220005';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('unlink step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step1Error;
          api.disconnectError = undefined;
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
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('copyAndDisconnect step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step2Error;
          api.unlinkError = undefined;
          api.disconnectError = step2ReleaseError;
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
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|disconnect|uri|u' +
            'ri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0600
     * @tc.name testDistributedFileSequence220006
     * @tc.desc Verify isolated three-copy recovery sequence unlink, copyAndDisconnect, copyAndDisconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220006';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('unlink step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
          api.unlinkError = step1Error;
          api.disconnectError = undefined;
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
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
          const step2Request: DistributedCopyRequest = distributedRequest(2);
          const step2Error: Error = new Error('copyAndDisconnect step 2');
          const step2ReleaseError: Error = new Error('release step 2');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = step2Error;
          api.unlinkError = undefined;
          api.disconnectError = step2ReleaseError;
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
          expect(api.events.slice(step2EventCount).join('|')).assertEqual('uri|uri|connect|copy|disconnect');
          expect(api.uriPaths.length - step2UriCount).assertEqual(2);
          expect(api.uriPaths[step2UriCount]).assertEqual('/distributed/source-2.txt');
          expect(api.networks.length - step2NetworkCount).assertEqual(1);
          expect(api.sources.length - step2CopyCount).assertEqual(1);
          expect(api.removed.length - step2RemovedCount).assertEqual(0);
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|disconnect|uri|u' +
            'ri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0700
     * @tc.name testDistributedFileSequence220007
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220007';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0800
     * @tc.name testDistributedFileSequence220008
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, sourceUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220008';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
          expect(api.events.join('|')).assertEqual(
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_0900
     * @tc.name testDistributedFileSequence220009
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, destinationUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220009';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1000
     * @tc.name testDistributedFileSequence220010
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220010';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri|connect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1100
     * @tc.name testDistributedFileSequence220011
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220011';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1200
     * @tc.name testDistributedFileSequence220012
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, unlink.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220012';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1300
     * @tc.name testDistributedFileSequence220013
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, disconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220013';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri|connect|copy|unlink|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1400
     * @tc.name testDistributedFileSequence220014
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, success, copyAndDisconnect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220014';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|connect|copy|unlink|disconnec' +
            't|uri|uri|connect|copy|disconnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1500
     * @tc.name testDistributedFileSequence220015
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, sourceUri, success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220015';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
            'uri|uri|connect|copy|unlink|disconnect|uri|uri|uri|connect|copy|unlink|disco' +
            'nnect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1600
     * @tc.name testDistributedFileSequence220016
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, sourceUri, sourceUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220016';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1700
     * @tc.name testDistributedFileSequence220017
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, sourceUri, destinationUri.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220017';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect|uri|uri|uri');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_DISTRIBUTED_FILE_SEQUENCE22_1800
     * @tc.name testDistributedFileSequence220018
     * @tc.desc Verify isolated three-copy recovery sequence disconnect, sourceUri, connect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileSequence220018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileSequence220018';
        console.info(`${TAG} start`);
        try {
          const api: RecordingDistributedApi = new RecordingDistributedApi();
          const step1Request: DistributedCopyRequest = distributedRequest(1);
          const step1Error: Error = new Error('disconnect step 1');
          const step1ReleaseError: Error = new Error('release step 1');
          api.uriCalls = 0;
          api.uriErrorAt = 0;
          api.uriError = undefined;
          api.connectError = undefined;
          api.copyError = undefined;
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
          expect(step1Outcome.error).assertEqual(step1ReleaseError);
          expect(api.events.slice(step1EventCount).join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect');
          expect(api.uriPaths.length - step1UriCount).assertEqual(2);
          expect(api.uriPaths[step1UriCount]).assertEqual('/distributed/source-1.txt');
          expect(api.networks.length - step1NetworkCount).assertEqual(1);
          expect(api.sources.length - step1CopyCount).assertEqual(1);
          expect(api.removed.length - step1RemovedCount).assertEqual(1);
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
          expect(api.removed[step1RemovedCount]).assertEqual('/distributed/source-1.txt');
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
          expect(api.events.join('|')).assertEqual('uri|uri|connect|copy|unlink|disconnect|uri|uri|uri|connect');
        } finally {
          console.info(`${TAG} end`);
        }
      });

  });
}
