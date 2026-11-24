/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import type { fileIo } from '@kit.CoreFileKit';
import { copyFromDistributed, writeTextFile } from '../main/ets/model/DistributedCopy';
import type { DistributedCopyApi, DistributedCopyRequest, FileDescriptorApi } from '../main/ets/model/DistributedCopy';

function expect(tag: string, actual: Object | undefined): Assert {
  const actualText: string = JSON.stringify(actual) ?? 'undefined';
  console.info(`${tag} assert actual=${actualText}`);
  return hypiumExpect(actual);
}

// This independent in-memory API records parameters and effects without calling the device SDK.
class LocalRecordingApi implements FileDescriptorApi, DistributedCopyApi {
  events: string[] = [];
  files: Map<string, string> = new Map<string, string>();
  openedPath: string = '';
  descriptorReleased: boolean = false;
  connectionReleased: boolean = false;

  open(path: string): number {
    this.events.push(`open:${path}`);
    this.openedPath = path;
    this.descriptorReleased = false;
    return 11;
  }

  write(fd: number, content: string): void {
    this.events.push(`write:${fd}:${content}`);
    if (fd !== 11 || this.descriptorReleased) {
      throw new Error('descriptor unavailable');
    }
    this.files.set(this.openedPath, content);
  }

  close(fd: number): void {
    this.events.push(`close:${fd}`);
    if (fd !== 11 || this.descriptorReleased) {
      throw new Error('descriptor unavailable');
    }
    this.descriptorReleased = true;
  }

  getUriFromPath(path: string): string {
    this.events.push(`uri:${path}`);
    return `file://${path}`;
  }

  connectDfs(networkId: string, listeners: fileIo.DfsListeners): Promise<void> {
    this.events.push(`connect:${networkId}`);
    this.connectionReleased = false;
    listeners.onStatus(networkId, 0);
    return Promise.resolve();
  }

  copy(source: string, destination: string, options: fileIo.CopyOptions): Promise<void> {
    this.events.push(`copy:${source}->${destination}`);
    const content: string | undefined = this.files.get(source.substring('file://'.length));
    if (content === undefined) {
      return Promise.reject(new Error('source missing'));
    }
    this.files.set(destination.substring('file://'.length), content);
    if (options.progressListener !== undefined) {
      const progress: fileIo.Progress = { processedSize: content.length, totalSize: content.length };
      options.progressListener(progress);
    }
    return Promise.resolve();
  }

  unlinkSync(path: string): void {
    this.events.push(`unlink:${path}`);
    this.files.delete(path);
  }

  disconnectDfs(networkId: string): Promise<void> {
    this.events.push(`disconnect:${networkId}`);
    this.connectionReleased = true;
    return Promise.resolve();
  }
}

export default function localUnitTest(): void {
  describe('localUnitTest', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LOCAL_0100
     * @tc.name testDistributedFileLocal0001
     * @tc.desc Compose text writing and distributed copying using an independent recording API.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLocal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLocal0001';
        console.info(`${TAG} start`);
        try {
          const api: LocalRecordingApi = new LocalRecordingApi();
          const payload: string = 'local payload';
          writeTextFile(' /distributed/source.txt ', payload, api);
          expect(TAG, api.files.get('/distributed/source.txt')).assertEqual(payload);
          expect(TAG, api.descriptorReleased).assertEqual(true);
          expect(TAG, api.events.join(',')).assertEqual(
            'open:/distributed/source.txt,write:11:local payload,close:11');

          let statusNetwork: string = '';
          let statusCode: number = -1;
          let processedSize: number = 0;
          let totalSize: number = 0;
          const request: DistributedCopyRequest = {
            networkId: ' local-peer ',
            sourcePath: ' /distributed/source.txt ',
            destinationPath: ' /sandbox/destination.txt ',
            listeners: {
              onStatus: (networkId: string, status: number): void => {
                statusNetwork = networkId;
                statusCode = status;
              }
            },
            options: {
              progressListener: (progress: fileIo.Progress): void => {
                processedSize = progress.processedSize;
                totalSize = progress.totalSize;
              }
            }
          };
          await copyFromDistributed(request, api);
          expect(TAG, api.files.get('/sandbox/destination.txt')).assertEqual(payload);
          expect(TAG, api.files.has('/distributed/source.txt')).assertEqual(false);
          expect(TAG, api.files.size).assertEqual(1);
          expect(TAG, api.events.join(',')).assertEqual(
            'open:/distributed/source.txt,write:11:local payload,close:11,' +
            'uri:/distributed/source.txt,uri:/sandbox/destination.txt,connect:local-peer,' +
            'copy:file:///distributed/source.txt->file:///sandbox/destination.txt,' +
            'unlink:/distributed/source.txt,disconnect:local-peer');
          expect(TAG, statusNetwork).assertEqual('local-peer');
          expect(TAG, statusCode).assertEqual(0);
          expect(TAG, processedSize).assertEqual(13);
          expect(TAG, totalSize).assertEqual(13);
          expect(TAG, api.connectionReleased).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
