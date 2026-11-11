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

import { localize } from '../../common/LocaleStrings';
/** Explicit user-requested backup copying. No clipboard read, automatic sync or cleanup is performed. */
import { pasteboard } from '@kit.BasicServicesKit';
import { readSceneBackup } from './SceneWorkspaceBackupModel';

export interface SceneBackupClipboardPort {
  writeLocalText(text: string): Promise<void>;
}

export class NativeSceneBackupClipboard implements SceneBackupClipboardPort {
  public writeLocalText(text: string): Promise<void> {
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    const property = data.getProperty();
    // SDK default is CROSSDEVICE: sensitive workspace backups must explicitly restrict this copy.
    property.shareOption = pasteboard.ShareOption.LOCALDEVICE;
    data.setProperty(property);
    return pasteboard.getSystemPasteboard().setData(data);
  }
}

export enum SceneBackupCopyCode {
  COPIED = 'COPIED',
  INVALID = 'INVALID',
  BUSY = 'BUSY',
  FAILED = 'FAILED',
  ABANDONED = 'ABANDONED',
  BLOCKED = 'BLOCKED'
}

export class SceneBackupCopyResult {
  public code: SceneBackupCopyCode;
  public copied: boolean;
  public message: string;
  constructor(code: SceneBackupCopyCode, message: string, copied: boolean = false) {
    this.code = code; this.message = message; this.copied = copied;
  }
}

export class SceneBackupClipboard {
  private readonly port: SceneBackupClipboardPort;
  private pending: boolean = false;
  private disposed: boolean = false;
  private generation: number = 0;
  constructor(port: SceneBackupClipboardPort = new NativeSceneBackupClipboard()) { this.port = port; }

  public async copy(raw: string): Promise<SceneBackupCopyResult> {
    if (this.disposed) { return new SceneBackupCopyResult(SceneBackupCopyCode.BLOCKED, localize('ac_scenebackupclipboard_001')); }
    if (this.pending) { return new SceneBackupCopyResult(SceneBackupCopyCode.BUSY, localize('ac_scenebackupclipboard_002')); }
    if (readSceneBackup(raw).workspace === undefined) {
      return new SceneBackupCopyResult(SceneBackupCopyCode.INVALID, localize('ac_scenebackupclipboard_003'));
    }
    const generation = ++this.generation;
    this.pending = true;
    try {
      await this.port.writeLocalText(raw);
      if (this.disposed || generation !== this.generation) {
        return new SceneBackupCopyResult(SceneBackupCopyCode.ABANDONED, localize('ac_scenebackupclipboard_004'), true);
      }
      return new SceneBackupCopyResult(SceneBackupCopyCode.COPIED, localize('ac_scenebackupclipboard_005'), true);
    } catch (error) {
      // Never echo platform error.message: it may contain the copied body or other private values.
      if (this.disposed || generation !== this.generation) {
        return new SceneBackupCopyResult(SceneBackupCopyCode.ABANDONED, localize('ac_scenebackupclipboard_006'));
      }
      return new SceneBackupCopyResult(SceneBackupCopyCode.FAILED, localize('ac_scenebackupclipboard_007'));
    } finally {
      if (generation === this.generation) { this.pending = false; }
    }
  }

  public dispose(): void { this.disposed = true; this.generation++; this.pending = false; }
}
