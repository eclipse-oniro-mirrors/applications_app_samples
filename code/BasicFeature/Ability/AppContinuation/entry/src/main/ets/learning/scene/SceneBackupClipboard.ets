/** Explicit user-requested backup copying. No clipboard read, automatic sync or cleanup is performed. */
import { pasteboard } from '@kit.BasicServicesKit';
import { readSceneBackup } from './SceneWorkspaceBackupModel';

export interface SceneBackupClipboardPort {
  writeLocalText(text: string): Promise<void>;
}

export class NativeSceneBackupClipboard implements SceneBackupClipboardPort {
  writeLocalText(text: string): Promise<void> {
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
  code: SceneBackupCopyCode;
  copied: boolean;
  message: string;
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

  async copy(raw: string): Promise<SceneBackupCopyResult> {
    if (this.disposed) { return new SceneBackupCopyResult(SceneBackupCopyCode.BLOCKED, '复制入口已释放；未访问剪贴板。'); }
    if (this.pending) { return new SceneBackupCopyResult(SceneBackupCopyCode.BUSY, '正在等待上次复制完成，请勿重复点击。'); }
    if (readSceneBackup(raw).workspace === undefined) {
      return new SceneBackupCopyResult(SceneBackupCopyCode.INVALID, '没有可复制的完整业务备份；未修改剪贴板。');
    }
    const generation = ++this.generation;
    this.pending = true;
    try {
      await this.port.writeLocalText(raw);
      if (this.disposed || generation !== this.generation) {
        return new SceneBackupCopyResult(SceneBackupCopyCode.ABANDONED, '备份复制已完成；原页面已离开，请自行管理剪贴板副本。', true);
      }
      return new SceneBackupCopyResult(SceneBackupCopyCode.COPIED, '业务备份已复制到本机剪贴板；内容未加密，请妥善保管。', true);
    } catch (error) {
      // Never echo platform error.message: it may contain the copied body or other private values.
      if (this.disposed || generation !== this.generation) {
        return new SceneBackupCopyResult(SceneBackupCopyCode.ABANDONED, '原页面已离开，复制结果不再更新该页面。');
      }
      return new SceneBackupCopyResult(SceneBackupCopyCode.FAILED, '备份复制失败；业务数据和输入保持不变。');
    } finally {
      if (generation === this.generation) { this.pending = false; }
    }
  }

  dispose(): void { this.disposed = true; this.generation++; this.pending = false; }
}
