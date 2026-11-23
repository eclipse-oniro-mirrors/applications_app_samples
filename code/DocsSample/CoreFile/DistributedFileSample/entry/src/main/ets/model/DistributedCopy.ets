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

import { fileIo, fileUri } from '@kit.CoreFileKit';

/** Captures an isolated distributed-copy request. */
export interface DistributedCopyRequest {
  networkId: string;
  sourcePath: string;
  destinationPath: string;
  listeners: fileIo.DfsListeners;
  options: fileIo.CopyOptions;
}

/** Abstracts distributed connection, copy, and cleanup operations. */
export interface DistributedCopyApi {
  getUriFromPath(path: string): string;
  connectDfs(networkId: string, listeners: fileIo.DfsListeners): Promise<void>;
  disconnectDfs(networkId: string): Promise<void>;
  copy(source: string, destination: string, options: fileIo.CopyOptions): Promise<void>;
  unlinkSync(path: string): void;
}

/** Abstracts descriptor acquisition, writing, and release. */
export interface FileDescriptorApi {
  open(path: string): number;
  write(fd: number, content: string): void;
  close(fd: number): void;
}

/** Identifies requests rejected before file or connection work begins. */
export class InvalidFileRequestError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'InvalidFileRequestError';
  }
}

/** Delegates local descriptor operations to the system file API. */
export class SystemFileDescriptor implements FileDescriptorApi {
  open(path: string): number {
    return fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE).fd;
  }
  write(fd: number, content: string): void {
    fileIo.writeSync(fd, content);
  }
  close(fd: number): void {
    fileIo.closeSync(fd);
  }
}

/** Delegates distributed-copy operations to the system file APIs. */
export class SystemDistributedCopy implements DistributedCopyApi {
  getUriFromPath(path: string): string {
    return fileUri.getUriFromPath(path);
  }
  connectDfs(networkId: string, listeners: fileIo.DfsListeners): Promise<void> {
    return fileIo.connectDfs(networkId, listeners);
  }
  disconnectDfs(networkId: string): Promise<void> {
    return fileIo.disconnectDfs(networkId);
  }
  copy(source: string, destination: string, options: fileIo.CopyOptions): Promise<void> {
    return fileIo.copy(source, destination, options);
  }
  unlinkSync(path: string): void {
    fileIo.unlinkSync(path);
  }
}

function requireText(value: string, label: string): string {
  const normalized: string = value.trim();
  if (normalized.length === 0) {
    throw new InvalidFileRequestError(`${label} must not be empty`);
  }
  return normalized;
}

function requireDescriptor(fd: number): number {
  if (!Number.isSafeInteger(fd) || fd < 0) {
    throw new InvalidFileRequestError('File descriptor must be a nonnegative safe integer');
  }
  return fd;
}

/** Copies a distributed source, cleans it on success, and always releases a connected DFS session. */
export async function copyFromDistributed(request: DistributedCopyRequest,
  api: DistributedCopyApi = new SystemDistributedCopy()): Promise<void> {
  const sourcePath: string = requireText(request.sourcePath, 'Source path');
  const destinationPath: string = requireText(request.destinationPath, 'Destination path');
  const networkId: string = requireText(request.networkId, 'Network ID');
  if (sourcePath === destinationPath) {
    throw new InvalidFileRequestError('Source and destination paths must differ');
  }
  const sourceUri: string = api.getUriFromPath(sourcePath);
  const destinationUri: string = api.getUriFromPath(destinationPath);
  const listeners: fileIo.DfsListeners = { onStatus: request.listeners.onStatus };
  const options: fileIo.CopyOptions = {
    progressListener: request.options.progressListener,
    copySignal: request.options.copySignal
  };
  let connected: boolean = false;
  let operationError: Error | undefined = undefined;
  try {
    await api.connectDfs(networkId, listeners);
    connected = true;
    await api.copy(sourceUri, destinationUri, options);
    api.unlinkSync(sourcePath);
  } catch (error) {
    operationError = error as Error;
  } finally {
    if (connected) {
      try {
        await api.disconnectDfs(networkId);
      } catch (error) {
        if (operationError === undefined) {
          operationError = error as Error;
        }
      }
    }
  }
  if (operationError !== undefined) {
    throw operationError;
  }
}

/** Writes through a validated descriptor and releases it on every post-open path. */
export function writeTextFile(path: string, content: string, api: FileDescriptorApi): void {
  const requestPath: string = requireText(path, 'File path');
  const fd: number = requireDescriptor(api.open(requestPath));
  let operationError: Error | undefined = undefined;
  try {
    api.write(fd, content);
  } catch (error) {
    operationError = error as Error;
  } finally {
    try {
      api.close(fd);
    } catch (error) {
      if (operationError === undefined) {
        operationError = error as Error;
      }
    }
  }
  if (operationError !== undefined) {
    throw operationError;
  }
}
