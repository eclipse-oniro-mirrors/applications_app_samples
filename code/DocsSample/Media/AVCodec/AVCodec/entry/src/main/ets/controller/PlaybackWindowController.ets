/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { UIContext, window } from '@kit.ArkUI';
import Logger from '../common/utils/Logger';

const TAG: string = 'PlaybackWindowController';
const VISIBLE_SYSTEM_BARS: ('status' | 'navigation')[] = ['navigation', 'status'];
const BLACK_SYSTEM_BAR_PROPERTIES: window.SystemBarProperties = {
  statusBarColor: '#000000',
  navigationBarColor: '#000000',
  statusBarContentColor: '#FFFFFF',
  navigationBarContentColor: '#FFFFFF'
};

export class PlaybackWindowController {
  private ui: () => UIContext;
  private getFullscreen: () => boolean;
  private setFullscreen: (fullscreen: boolean) => void;
  private setToolsVisible: (visible: boolean) => void;
  private showControls: () => void;
  private clearControls: () => void;
  private setControlsVisible: (visible: boolean) => void;

  constructor(ui: () => UIContext, getFullscreen: () => boolean,
    setFullscreen: (fullscreen: boolean) => void,
    setToolsVisible: (visible: boolean) => void,
    showControls: () => void,
    clearControls: () => void,
    setControlsVisible: (visible: boolean) => void) {
    this.ui = ui;
    this.getFullscreen = getFullscreen;
    this.setFullscreen = setFullscreen;
    this.setToolsVisible = setToolsVisible;
    this.showControls = showControls;
    this.clearControls = clearControls;
    this.setControlsVisible = setControlsVisible;
  }

  toggle(): void {
    const hostContext = this.ui().getHostContext();
    if (hostContext === undefined) {
      return;
    }
    this.setToolsVisible(false);
    const targetFullscreen: boolean = !this.getFullscreen();
    this.setFullscreen(targetFullscreen);
    if (targetFullscreen) {
      this.showControls();
    } else {
      this.clearControls();
      this.setControlsVisible(true);
    }
    window.getLastWindow(hostContext).then((mainWindow: window.Window) => {
      const orientation = targetFullscreen ? window.Orientation.AUTO_ROTATION_LANDSCAPE :
        window.Orientation.UNSPECIFIED;
      mainWindow.setPreferredOrientation(orientation).then(() => {
        return mainWindow.setWindowLayoutFullScreen(targetFullscreen);
      }).then(() => {
        return mainWindow.setWindowSystemBarProperties(BLACK_SYSTEM_BAR_PROPERTIES);
      }).then(() => {
        return mainWindow.setWindowSystemBarEnable(targetFullscreen ? [] : VISIBLE_SYSTEM_BARS);
      }).catch((error: Error) => {
        Logger.error(TAG, 'Update playback window mode failed: ' + JSON.stringify(error));
      });
    }).catch((error: Error) => {
      Logger.error(TAG, 'Get main window failed: ' + JSON.stringify(error));
    });
  }
}
