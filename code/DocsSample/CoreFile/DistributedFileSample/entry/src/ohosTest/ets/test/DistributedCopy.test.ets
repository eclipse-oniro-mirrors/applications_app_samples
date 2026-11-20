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

import { fileIo } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import { copyFromDistributed, SystemDistributedCopy, writeTextFile } from '../../../main/ets/model/DistributedCopy';
import type {
  DistributedCopyApi,
  DistributedCopyRequest,
  FileDescriptorApi
} from '../../../main/ets/model/DistributedCopy';

const DOMAIN: number = 0xF811;

function expect(tag: string, actual: Object | undefined): Assert {
  const actualText: string = JSON.stringify(actual) ?? 'undefined';
  hilog.info(DOMAIN, tag, 'assert actual=%{public}s', actualText);
  return hypiumExpect(actual);
}

class DistributedApiProbe implements DistributedCopyApi {
  events: string[] = [];
  failAt: string = '';
  copiedOptions: fileIo.CopyOptions | undefined = undefined;

  getUriFromPath(path: string): string {
    this.events.push(`uri:${path}`);
    return `file://${path}`;
  }

  connectDfs(networkId: string, listeners: fileIo.DfsListeners): Promise<void> {
    this.events.push(`connect:${networkId}`);
    if (this.failAt === 'connect') {
      listeners.onStatus(networkId, 13900046);
      return Promise.reject(new Error('connection interrupted'));
    }
    return Promise.resolve();
  }

  disconnectDfs(networkId: string): Promise<void> {
    this.events.push(`disconnect:${networkId}`);
    if (this.failAt === 'disconnect') {
      return Promise.reject(new Error('disconnect failed'));
    }
    return Promise.resolve();
  }

  copy(source: string, destination: string, options: fileIo.CopyOptions): Promise<void> {
    this.events.push(`copy:${source}->${destination}`);
    this.copiedOptions = options;
    if (this.failAt === 'copy') {
      return Promise.reject(new Error('copy failed'));
    }
    if (options.progressListener !== undefined) {
      const progress: fileIo.Progress = { processedSize: 7, totalSize: 7 };
      options.progressListener(progress);
    }
    return Promise.resolve();
  }

  unlinkSync(path: string): void {
    this.events.push(`unlink:${path}`);
    if (this.failAt === 'unlink') {
      throw new Error('cleanup failed');
    }
  }
}

class UriFailureProbe extends DistributedApiProbe {
  getUriFromPath(path: string): string {
    throw new Error('uri conversion failed');
  }
}

class DoubleFailureProbe extends DistributedApiProbe {
  copy(source: string, destination: string, options: fileIo.CopyOptions): Promise<void> {
    this.events.push('copy');
    return Promise.reject(new Error('primary copy failed'));
  }

  disconnectDfs(networkId: string): Promise<void> {
    this.events.push('disconnect');
    return Promise.reject(new Error('secondary disconnect failed'));
  }
}

// Device-only integration: URI conversion, copying and deletion still use the real SDK.
class LocalFileIoWithConnectionStub extends SystemDistributedCopy {
  events: string[] = [];

  connectDfs(networkId: string, listeners: fileIo.DfsListeners): Promise<void> {
    this.events.push(`connect:${networkId}`);
    return Promise.resolve();
  }

  disconnectDfs(networkId: string): Promise<void> {
    this.events.push(`disconnect:${networkId}`);
    return Promise.resolve();
  }
}

class FileDescriptorProbe implements FileDescriptorApi {
  events: string[] = [];
  descriptor: number = 7;
  failAt: string = '';

  open(path: string): number {
    this.events.push(`open:${path}`);
    if (this.failAt === 'open') {
      throw new Error('open failed');
    }
    return this.descriptor;
  }

  write(fd: number, content: string): void {
    this.events.push(`write:${fd}:${content}`);
    if (this.failAt === 'write') {
      throw new Error('write failed');
    }
  }

  close(fd: number): void {
    this.events.push(`close:${fd}`);
    if (this.failAt === 'close') {
      throw new Error('close failed');
    }
  }
}

function copyRequest(): DistributedCopyRequest {
  return {
    networkId: 'peer-A',
    sourcePath: '/distributed/src.txt',
    destinationPath: '/sandbox/dest.txt',
    listeners: { onStatus: (networkId: string, status: number): void => {} },
    options: {}
  };
}

export default function distributedCopyTest(): void {
  describe('DistributedCopyBusiness', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0100
     * @tc.name testDistributedFileLegacy0001
     * @tc.desc Connect, copy, delete only the source, and disconnect in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0001';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          await copyFromDistributed(copyRequest(), api);
          expect(TAG, api.events.join(',')).assertEqual(
            'uri:/distributed/src.txt,uri:/sandbox/dest.txt,connect:peer-A,' +
            'copy:file:///distributed/src.txt->file:///sandbox/dest.txt,unlink:/distributed/src.txt,disconnect:peer-A');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0200
     * @tc.name testDistributedFileLegacy0002
     * @tc.desc Preserve the source and forward peer status when connection fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0002';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          api.failAt = 'connect';
          const input: DistributedCopyRequest = copyRequest();
          let statusCode: number = 0;
          let statusNetwork: string = '';
          input.listeners = {
            onStatus: (networkId: string, status: number): void => {
              statusCode = status;
              statusNetwork = networkId;
            }
          };
          let message: string = '';
          try {
            await copyFromDistributed(input, api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, statusNetwork).assertEqual('peer-A');
          expect(TAG, message).assertEqual('connection interrupted');
          expect(TAG, statusCode).assertEqual(13900046);
          expect(TAG, api.events.join(',')).assertEqual(
            'uri:/distributed/src.txt,uri:/sandbox/dest.txt,connect:peer-A');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0300
     * @tc.name testDistributedFileLegacy0003
     * @tc.desc Preserve the temporary source and disconnect when copying fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0003';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          api.failAt = 'copy';
          let message: string = '';
          try {
            await copyFromDistributed(copyRequest(), api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('copy failed');
          expect(TAG, api.events.join(',')).assertEqual(
            'uri:/distributed/src.txt,uri:/sandbox/dest.txt,connect:peer-A,' +
            'copy:file:///distributed/src.txt->file:///sandbox/dest.txt,disconnect:peer-A');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0400
     * @tc.name testDistributedFileLegacy0004
     * @tc.desc Report source cleanup failure without copying twice and release the connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0004';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          api.failAt = 'unlink';
          let message: string = '';
          try {
            await copyFromDistributed(copyRequest(), api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('cleanup failed');
          expect(TAG, api.events.length).assertEqual(6);
          expect(TAG, api.events[5]).assertEqual('disconnect:peer-A');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0500
     * @tc.name testDistributedFileLegacy0005
     * @tc.desc Reject equal source and destination paths before issuing file operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0005';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          const input: DistributedCopyRequest = copyRequest();
          input.destinationPath = input.sourcePath;
          let message: string = '';
          try {
            await copyFromDistributed(input, api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('Source and destination paths must differ');
          expect(TAG, api.events.length).assertEqual(0);
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0600
     * @tc.name testDistributedFileLegacy0006
     * @tc.desc Use the original request snapshot despite edits during an asynchronous copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0006';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          const input: DistributedCopyRequest = copyRequest();
          const pending: Promise<void> = copyFromDistributed(input, api);
          input.sourcePath = '/other/source';
          input.destinationPath = '/other/destination';
          input.networkId = 'peer-B';
          await pending;
          expect(TAG, api.events.join(',')).assertEqual(
            'uri:/distributed/src.txt,uri:/sandbox/dest.txt,connect:peer-A,' +
            'copy:file:///distributed/src.txt->file:///sandbox/dest.txt,unlink:/distributed/src.txt,disconnect:peer-A');
          expect(TAG, input.sourcePath).assertEqual('/other/source');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0700
     * @tc.name testDistributedFileLegacy0007
     * @tc.desc Keep the original progress listener when request options are changed after invocation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0007';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          const input: DistributedCopyRequest = copyRequest();
          let processed: number = 0;
          let total: number = 0;
          input.options.progressListener = (progress: fileIo.Progress): void => {
            processed = progress.processedSize;
            total = progress.totalSize;
          };
          const pending: Promise<void> = copyFromDistributed(input, api);
          input.options.progressListener = undefined;
          await pending;
          expect(TAG, total).assertEqual(7);
          expect(TAG, processed).assertEqual(7);
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0800
     * @tc.name testDistributedFileLegacy0008
     * @tc.desc Trim request paths and the network ID before URI conversion and connection calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0008';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          const input: DistributedCopyRequest = copyRequest();
          input.networkId = ' peer-A ';
          input.sourcePath = ' /distributed/src.txt ';
          input.destinationPath = ' /sandbox/dest.txt ';
          await copyFromDistributed(input, api);
          expect(TAG, api.events[0]).assertEqual('uri:/distributed/src.txt');
          expect(TAG, api.events[2]).assertEqual('connect:peer-A');
          expect(TAG, api.events[5]).assertEqual('disconnect:peer-A');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_0900
     * @tc.name testDistributedFileLegacy0009
     * @tc.desc Reject a whitespace-only network ID before converting either path to a URI.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0009';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          const input: DistributedCopyRequest = copyRequest();
          input.networkId = ' \t ';
          let message: string = '';
          try {
            await copyFromDistributed(input, api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('Network ID must not be empty');
          expect(TAG, api.events.length).assertEqual(0);
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1000
     * @tc.name testDistributedFileLegacy0010
     * @tc.desc Report URI conversion failure without opening a distributed connection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0010';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: UriFailureProbe = new UriFailureProbe();
          let message: string = '';
          try {
            await copyFromDistributed(copyRequest(), api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('uri conversion failed');
          expect(TAG, api.events.length).assertEqual(0);
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1100
     * @tc.name testDistributedFileLegacy0011
     * @tc.desc Report a disconnect failure after successful copying and source cleanup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0011';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DistributedApiProbe = new DistributedApiProbe();
          api.failAt = 'disconnect';
          let message: string = '';
          try {
            await copyFromDistributed(copyRequest(), api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('disconnect failed');
          expect(TAG, api.events[4]).assertEqual('unlink:/distributed/src.txt');
          expect(TAG, api.events[5]).assertEqual('disconnect:peer-A');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1200
     * @tc.name testDistributedFileLegacy0012
     * @tc.desc Preserve the primary copy error when disconnect also fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileLegacy0012';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const api: DoubleFailureProbe = new DoubleFailureProbe();
          let message: string = '';
          try {
            await copyFromDistributed(copyRequest(), api);
          } catch (error) {
            message = (error as Error).message;
          }
          expect(TAG, message).assertEqual('primary copy failed');
          expect(TAG, api.events[api.events.length - 1]).assertEqual('disconnect');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1300
     * @tc.name testDistributedFileLegacy0013
     * @tc.desc Trim the file path, write the payload, and close the descriptor exactly once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDistributedFileLegacy0013';
      hilog.info(DOMAIN, TAG, `${TAG} start`);
      try {
        const api: FileDescriptorProbe = new FileDescriptorProbe();
        writeTextFile(' /sandbox/file.txt ', 'payload', api);
        expect(TAG, api.events.join(',')).assertEqual('open:/sandbox/file.txt,write:7:payload,close:7');
      } finally {
        hilog.info(DOMAIN, TAG, `${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1400
     * @tc.name testDistributedFileLegacy0014
     * @tc.desc Close the descriptor after a write failure and propagate the original write error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDistributedFileLegacy0014';
      hilog.info(DOMAIN, TAG, `${TAG} start`);
      try {
        const api: FileDescriptorProbe = new FileDescriptorProbe();
        api.failAt = 'write';
        let message: string = '';
        try {
          writeTextFile('/sandbox/file.txt', 'payload', api);
        } catch (error) {
          message = (error as Error).message;
        }
        expect(TAG, message).assertEqual('write failed');
        expect(TAG, api.events.join(',')).assertEqual('open:/sandbox/file.txt,write:7:payload,close:7');
      } finally {
        hilog.info(DOMAIN, TAG, `${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1500
     * @tc.name testDistributedFileLegacy0015
     * @tc.desc Report descriptor close failure after successfully writing empty text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDistributedFileLegacy0015';
      hilog.info(DOMAIN, TAG, `${TAG} start`);
      try {
        const api: FileDescriptorProbe = new FileDescriptorProbe();
        api.failAt = 'close';
        let message: string = '';
        try {
          writeTextFile('/sandbox/file.txt', '', api);
        } catch (error) {
          message = (error as Error).message;
        }
        expect(TAG, message).assertEqual('close failed');
        expect(TAG, api.events.length).assertEqual(3);
      } finally {
        hilog.info(DOMAIN, TAG, `${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1600
     * @tc.name testDistributedFileLegacy0016
     * @tc.desc Reject a negative descriptor before writing or attempting descriptor release.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDistributedFileLegacy0016';
      hilog.info(DOMAIN, TAG, `${TAG} start`);
      try {
        const api: FileDescriptorProbe = new FileDescriptorProbe();
        api.descriptor = -1;
        let errorName: string = '';
        try {
          writeTextFile('/sandbox/file.txt', 'payload', api);
        } catch (error) {
          errorName = (error as Error).name;
        }
        expect(TAG, errorName).assertEqual('InvalidFileRequestError');
        expect(TAG, api.events.join(',')).assertEqual('open:/sandbox/file.txt');
      } finally {
        hilog.info(DOMAIN, TAG, `${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1700
     * @tc.name testDistributedFileLegacy0017
     * @tc.desc Propagate an open failure without attempting to write or close a descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDistributedFileLegacy0017';
      hilog.info(DOMAIN, TAG, `${TAG} start`);
      try {
        const api: FileDescriptorProbe = new FileDescriptorProbe();
        api.failAt = 'open';
        let message: string = '';
        try {
          writeTextFile('/sandbox/file.txt', 'payload', api);
        } catch (error) {
          message = (error as Error).message;
        }
        expect(TAG, message).assertEqual('open failed');
        expect(TAG, api.events.join(',')).assertEqual('open:/sandbox/file.txt');
      } finally {
        hilog.info(DOMAIN, TAG, `${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_LEGACY_1800
     * @tc.name testDistributedFileLegacy0018
     * @tc.desc Reject a whitespace-only file path before opening a descriptor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileLegacy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDistributedFileLegacy0018';
      hilog.info(DOMAIN, TAG, `${TAG} start`);
      try {
        const api: FileDescriptorProbe = new FileDescriptorProbe();
        let message: string = '';
        try {
          writeTextFile('  ', 'payload', api);
        } catch (error) {
          message = (error as Error).message;
        }
        expect(TAG, message).assertEqual('File path must not be empty');
        expect(TAG, api.events.length).assertEqual(0);
      } finally {
        hilog.info(DOMAIN, TAG, `${TAG} end`);
      }
    });
  });
  describe('DistributedCopyRealFileIoWithConnectionStub', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_REALFILEIO_0100
     * @tc.name testDistributedFileRealFileIo0001
     * @tc.desc Copy and clean an owned device SDK file with only the connection lifecycle substituted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileRealFileIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileRealFileIo0001';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const filesDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
          const root: string = `${filesDir}/task26-${Date.now()}`;
          fileIo.mkdirSync(root);
          try {
            const sourcePath: string = `${root}/source.txt`;
            const destinationPath: string = `${root}/destination.txt`;
            const source: fileIo.File = fileIo.openSync(sourcePath,
              fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
            try {
              fileIo.writeSync(source.fd, 'cross-directory payload');
            } finally {
              fileIo.closeSync(source.fd);
            }
            const input: DistributedCopyRequest = {
              networkId: 'connection-stub',
              sourcePath: sourcePath,
              destinationPath: destinationPath,
              listeners: { onStatus: (networkId: string, status: number): void => {} },
              options: {}
            };
            const api: LocalFileIoWithConnectionStub = new LocalFileIoWithConnectionStub();
            await copyFromDistributed(input, api);
            expect(TAG, fileIo.readTextSync(destinationPath)).assertEqual('cross-directory payload');
            expect(TAG, fileIo.accessSync(sourcePath)).assertEqual(false);
            expect(TAG, api.events.join(',')).assertEqual('connect:connection-stub,disconnect:connection-stub');
          } finally {
            // Delete only this case's newly created directory, never the shared files directory.
            fileIo.rmdirSync(root);
          }
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
  });
}
