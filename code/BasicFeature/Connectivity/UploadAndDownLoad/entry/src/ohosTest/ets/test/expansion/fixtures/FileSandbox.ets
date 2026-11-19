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
import fs from '@ohos.file.fs';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { finishCleanup } from './CleanupFailure';

// Input/output fixture only: SDK file operations, not application algorithms.
export class FileSandbox {
  public readonly root: string;
  constructor(caseId: string) {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    this.root = `${context.cacheDir}/exp_upload_${caseId}_${Date.now()}_${Math.floor(Math.random() * 1000000000)}`;
    fs.mkdirSync(this.root);
  }
  mkdir(relative: string): void {
    fs.mkdirSync(`${this.root}/${relative}`);
  }
  write(relative: string, bytes: number[]): void {
    const file = fs.openSync(
      `${this.root}/${relative}`,
      fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC
    );
    let primaryFailed = true;
    try {
      if (bytes.length > 0) {
        const buffer = new Uint8Array(bytes);
        const written = fs.writeSync(file.fd, buffer.buffer);
        if (written !== bytes.length) {
          throw new Error(`Short fixture write: ${written}/${bytes.length}`);
        }
      }
      primaryFailed = false;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        fs.closeSync(file.fd);
      });
    }
  }
  read(relative: string): number[] {
    const path = `${this.root}/${relative}`;
    const size = fs.statSync(path).size;
    const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
    let primaryFailed = true;
    try {
      const buffer = new ArrayBuffer(size);
      const count = size === 0 ? 0 : fs.readSync(file.fd, buffer);
      if (count !== size) {
        throw new Error(`Short fixture read: ${count}/${size}`);
      }
      const result: number[] = [];
      const view = new Uint8Array(buffer);
      for (let i = 0; i < view.length; i++) {
        result.push(view[i]);
      }
      primaryFailed = false;
      return result;
    } finally {
      finishCleanup(primaryFailed, (): void => {
        fs.closeSync(file.fd);
      });
    }
  }
  private removeTree(path: string): void {
    // All descendants were created by this fixture; never follows user paths.
    const children = fs.listFileSync(path);
    for (let i = 0; i < children.length; i++) {
      const child = `${path}/${children[i]}`;
      if (fs.statSync(child).isDirectory()) {
        this.removeTree(child);
      } else {
        fs.unlinkSync(child);
      }
    }
    fs.rmdirSync(path);
  }
  dispose(): void {
    this.removeTree(this.root);
    if (fs.accessSync(this.root)) {
      throw new Error(`Sandbox cleanup failed: ${this.root}`);
    }
  }
}
