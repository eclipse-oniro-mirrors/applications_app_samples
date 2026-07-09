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

import { Logger } from '../utils/Logger';
import { MediaControlCenter } from './MediaControlCenter';

const TAG = 'MediaControlCenterCallbackAction';

export class MediaControlCenterCallbackAction {
  private static mediaControlCenterCallbackAction: MediaControlCenterCallbackAction;

  public static getInstance(): MediaControlCenterCallbackAction {
    if (!MediaControlCenterCallbackAction.mediaControlCenterCallbackAction) {
      Logger.info(TAG, 'no mediaControlCenterHandle')
      MediaControlCenterCallbackAction.mediaControlCenterCallbackAction = new MediaControlCenterCallbackAction();
    }
    return MediaControlCenterCallbackAction.mediaControlCenterCallbackAction;
  }

  doPlayAction() {
    // When the monitoring focus is released and it is necessary to restore the focus, the playback state of the new upper layer needs to be refreshed
    MediaControlCenter.getInstance().play();
  }

  doPauseAction() {
    // When the monitoring focus is preempted and a pause needs to be executed, the playback state of the new upper layer needs to be refreshed
    MediaControlCenter.getInstance().updateIsPlay(false);
  }

  doStopAction() {
    // When the monitoring focus is seized and it is necessary to stop, the playback state of the new upper layer needs to be refreshed
    MediaControlCenter.getInstance().stop();
    MediaControlCenter.getInstance().updateIsPlay(false);
  }
}