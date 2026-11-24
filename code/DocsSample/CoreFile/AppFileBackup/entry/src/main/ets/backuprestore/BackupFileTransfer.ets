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

export interface BackupTransferFile {
  fd: number;
  bundleName: string;
  uri: string;
}

export interface BackupTransferIo {
  accessSync(path: string): boolean;
  mkdirSync(path: string): void;
  copyFileSync(source: string | number, destination: string | number): void;
  closeSync(fd: number): void;
}

export class SystemBackupTransferIo implements BackupTransferIo {
  accessSync(path: string): boolean {
    return fileIo.accessSync(path);
  }
  mkdirSync(path: string): void {
    fileIo.mkdirSync(path);
  }
  copyFileSync(source: string | number, destination: string | number): void {
    fileIo.copyFileSync(source, destination);
  }
  closeSync(fd: number): void {
    fileIo.closeSync(fd);
  }
}

function backupPath(filesDir: string, file: BackupTransferFile): string {
  if (file.bundleName === '' || file.bundleName === '.' || file.bundleName === '..' ||
    file.bundleName.includes('/') || file.bundleName.includes('\\') || file.bundleName.includes('\u0000')) {
    throw new Error('Invalid backup bundle name');
  }
  const segments: string[] = file.uri.split('/');
  if (file.uri.includes('\\') || file.uri.includes('\u0000') ||
    segments.some((segment: string): boolean => segment === '' || segment === '.' || segment === '..')) {
    throw new Error('Invalid backup file URI');
  }
  return `${filesDir}/${file.bundleName}/${file.uri}`;
}

/** Copies the received backup descriptor into the archive and always releases the original descriptor. */
export function storeBackupFile(filesDir: string, file: BackupTransferFile,
  io: BackupTransferIo = new SystemBackupTransferIo()): void {
  const fd: number = file.fd;
  try {
    const destination: string = backupPath(filesDir, file);
    const bundlePath: string = `${filesDir}/${file.bundleName}`;
    if (!io.accessSync(bundlePath)) {
      io.mkdirSync(bundlePath);
    }
    io.copyFileSync(fd, destination);
  } finally {
    io.closeSync(fd);
  }
}

/** Copies the archived bytes into the received descriptor and always releases that original descriptor. */
export function restoreBackupFile(filesDir: string, file: BackupTransferFile,
  io: BackupTransferIo = new SystemBackupTransferIo()): void {
  const fd: number = file.fd;
  try {
    const source: string = backupPath(filesDir, file);
    io.copyFileSync(source, fd);
  } finally {
    io.closeSync(fd);
  }
}
