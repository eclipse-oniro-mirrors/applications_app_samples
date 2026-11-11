import { shortcutManager } from '@kit.AbilityKit';

export interface ShortcutApi {
  isShortcutSupported(): boolean;
  getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]>;
  setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void>;
}

export class PlatformShortcutApi implements ShortcutApi {
  isShortcutSupported(): boolean {
    return shortcutManager.isShortcutSupported();
  }

  getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]> {
    return shortcutManager.getAllShortcutInfoForSelf();
  }

  setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    return shortcutManager.setShortcutVisibleForSelf(id, visible);
  }
}
