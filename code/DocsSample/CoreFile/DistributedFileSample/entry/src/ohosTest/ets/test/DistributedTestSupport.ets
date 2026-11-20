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

import { expect as hypiumExpect } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import type { fileIo } from '@kit.CoreFileKit';
import type {
  DistributedCopyApi, DistributedCopyRequest, FileDescriptorApi
} from '../../../main/ets/model/DistributedCopy';

export interface DistributedOutcome {
  threw: boolean;
  error: Error | undefined;
}

export function expect(actual: Object | undefined): Assert {
  console.info(`assert actual=${JSON.stringify(actual)}`);
  return hypiumExpect(actual);
}

export async function captureDistributed(operation: () => Promise<void>): Promise<DistributedOutcome> {
  try {
    await operation();
    return { threw: false, error: undefined };
  } catch (error) {
    return { threw: true, error: error as Error };
  }
}

export function captureDescriptor(operation: () => void): DistributedOutcome {
  try {
    operation();
    return { threw: false, error: undefined };
  } catch (error) {
    return { threw: true, error: error as Error };
  }
}

export function distributedRequest(index: number): DistributedCopyRequest {
  return {
    networkId: ` peer-${index} `, sourcePath: ` /distributed/source-${index}.txt `,
    destinationPath: ` /sandbox/destination-${index}.txt `,
    listeners: { onStatus: (networkId: string, status: number): void => {} }, options: {}
  };
}

export class RecordingDistributedApi implements DistributedCopyApi {
  events: string[] = [];
  uriPaths: string[] = [];
  networks: string[] = [];
  disconnected: string[] = [];
  sources: string[] = [];
  destinations: string[] = [];
  removed: string[] = [];
  listeners: fileIo.DfsListeners[] = [];
  options: fileIo.CopyOptions[] = [];
  uriCalls: number = 0;
  uriErrorAt: number = 0;
  uriError: Error | undefined = undefined;
  connectError: Error | undefined = undefined;
  copyError: Error | undefined = undefined;
  unlinkError: Error | undefined = undefined;
  disconnectError: Error | undefined = undefined;
  onOperation: ((phase: string) => void) | undefined = undefined;

  getUriFromPath(value: string): string {
    this.events.push('uri');
    this.uriPaths.push(value);
    this.uriCalls++;
    this.onOperation?.('uri');
    if (this.uriCalls === this.uriErrorAt && this.uriError !== undefined) {
      throw this.uriError;
    }
    return `mock:${value}`;
  }

  connectDfs(networkId: string, listeners: fileIo.DfsListeners): Promise<void> {
    this.events.push('connect');
    this.networks.push(networkId);
    this.listeners.push(listeners);
    this.onOperation?.('connect');
    if (this.connectError !== undefined) {
      return Promise.reject(this.connectError);
    }
    return Promise.resolve();
  }

  copy(source: string, destination: string, options: fileIo.CopyOptions): Promise<void> {
    this.events.push('copy');
    this.sources.push(source);
    this.destinations.push(destination);
    this.options.push(options);
    this.onOperation?.('copy');
    if (this.copyError !== undefined) {
      return Promise.reject(this.copyError);
    }
    options.progressListener?.({ processedSize: 7, totalSize: 11 });
    return Promise.resolve();
  }

  unlinkSync(value: string): void {
    this.events.push('unlink');
    this.removed.push(value);
    this.onOperation?.('unlink');
    if (this.unlinkError !== undefined) {
      throw this.unlinkError;
    }
  }

  disconnectDfs(networkId: string): Promise<void> {
    this.events.push('disconnect');
    this.disconnected.push(networkId);
    this.onOperation?.('disconnect');
    if (this.disconnectError !== undefined) {
      return Promise.reject(this.disconnectError);
    }
    return Promise.resolve();
  }
}

export class RecordingDescriptorApi implements FileDescriptorApi {
  events: string[] = [];
  paths: string[] = [];
  descriptors: number[] = [];
  contents: string[] = [];
  closed: number[] = [];
  fd: number = 0;
  openError: Error | undefined = undefined;
  writeError: Error | undefined = undefined;
  closeError: Error | undefined = undefined;

  open(value: string): number {
    this.events.push('open');
    this.paths.push(value);
    if (this.openError !== undefined) {
      throw this.openError;
    }
    return this.fd;
  }

  write(fd: number, content: string): void {
    this.events.push('write');
    this.descriptors.push(fd);
    this.contents.push(content);
    if (this.writeError !== undefined) {
      throw this.writeError;
    }
  }

  close(fd: number): void {
    this.events.push('close');
    this.closed.push(fd);
    if (this.closeError !== undefined) {
      throw this.closeError;
    }
  }
}
