import { window } from '@kit.ArkUI';
import Constants from './Constants';

export class SubWindowManager {
  private static window: window.Window = window.findWindow(Constants.SUB_WINDOW_NAME);

  public static open() {
    SubWindowManager.window.showWindow()
  }

  public static hide() {
    SubWindowManager.window.minimize()
  }

  public static destroy() {
    SubWindowManager.window.destroyWindow()
  }
}