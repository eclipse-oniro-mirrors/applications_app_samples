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

export interface DownloadFileApi {
  list(path: string): string[];
  isFile(path: string): boolean;
  copy(source: string, destination: string): void;
  open(path: string): number;
  write(fd: number, message: string): void;
  close(fd: number): void;
}

export class SystemDownloadFiles implements DownloadFileApi {
  list(path: string): string[] {
    return fileIo.listFileSync(path);
  }
  isFile(path: string): boolean {
    return fileIo.statSync(path).isFile();
  }
  copy(source: string, destination: string): void {
    fileIo.copyFileSync(source, destination);
  }
  open(path: string): number {
    return fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC).fd;
  }
  write(fd: number, message: string): void {
    fileIo.writeSync(fd, message);
  }
  close(fd: number): void {
    fileIo.closeSync(fd);
  }
}

export function importDownloadFiles(downloadPath: string, sandboxPath: string,
  api: DownloadFileApi = new SystemDownloadFiles()): string[] {
  if (downloadPath === '' || sandboxPath === '' || downloadPath === sandboxPath) {
    throw new Error('Invalid download import directories');
  }
  const entries: string[] = api.list(downloadPath).slice();
  // Validate the complete listing before copying anything into the application sandbox.
  entries.forEach((entry: string): void => {
    if (entry === '' || entry === '.' || entry === '..' || entry.includes('/') ||
      entry.includes('\\') || entry.includes('\u0000')) {
      throw new Error('Invalid download entry');
    }
  });
  entries.forEach((entry: string): void => {
    const source: string = `${downloadPath}/${entry}`;
    if (api.isFile(source)) {
      api.copy(source, `${sandboxPath}/${entry}`);
    }
  });
  return api.list(sandboxPath).slice();
}

export function writeDownloadMessage(downloadPath: string, message: string,
  api: DownloadFileApi = new SystemDownloadFiles()): void {
  if (downloadPath === '') {
    throw new Error('Invalid download write directory');
  }
  const fd: number = api.open(`${downloadPath}/temp.txt`);
  try {
    api.write(fd, message);
  } finally {
    api.close(fd);
  }
}
