/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, WatchEvent } from '@kit.CoreFileKit';
import Logger from '../../common/Logger';

// watched events: IN_CREATE = 0x100，IN_DELETE = 0x200，IN_MODIFY = 0x2
const WATCH_EVENTS: number = 0x100 | 0x200 | 0x2;

@Entry
@Component
struct Index {
  @State result: string = ''; // used to display callback message
  private watcher: fs.Watcher | null = null;

  build() {
    Column({ space: 10 }) {
      Button($r('app.string.registerToMonitorButton'))
        .width('80%') // button width takes 80% of screen width
        .height('10%') // button height takes 10% of screen height
        .fontSize($r('app.float.size_25')) // button font size is 25
        .borderRadius($r('app.float.size_25')) // button corner radius is 25
        .backgroundColor($r('app.color.whiteColor')) // button background color is white
        .shadow({
          radius: $r('app.float.size_10'), // shadow radius is 10
          color: $r('app.color.grayColor'), // shadow color is gray
          offsetX: $r('app.float.size_15'), // shadow horizontal offset is 15
          offsetY: $r('app.float.size_15') // shadow vertical offset is 15
        })
        .fontColor($r('app.color.blackColor')) // button font color is black
        .onClick(() => {
          this.registerObserver();
        })

      Button($r('app.string.cancelMonitorButton'))
        .width('80%') // button width takes 80% of screen width
        .height('10%') // button height takes 10% of screen height
        .fontSize($r('app.float.size_25')) // button font size is 25
        .borderRadius($r('app.float.size_25')) // button corner radius is 25
        .backgroundColor($r('app.color.whiteColor')) // button background color is white
        .shadow({
          radius: $r('app.float.size_10'), // shadow radius is 10
          color: $r('app.color.grayColor'), // shadow color is gray
          offsetX: $r('app.float.size_15'), // shadow horizontal offset is 15
          offsetY: $r('app.float.size_15') // shadow vertical offset is 15
        })
        .fontColor($r('app.color.blackColor')) // button font color is black
        .onClick(() => {
          this.unregisterObserver();
        })

      Text(this.result)
        .fontSize($r('app.float.size_50')) // text font size is 50
        .fontWeight(FontWeight.Bold) // text font is bold
        .margin({ top: $r('app.float.size_20') }) // text top margin is 20
    }
    .width('100%') // outer column width fills the screen
    .height('100%') // outer column height fills the screen
    .alignItems(HorizontalAlign.Center) // align items horizontally centered
    .justifyContent(FlexAlign.Center) // justify content vertically centered
    .backgroundColor($r('app.color.lightGrayColor')) // background color is light gray
  }

  // [Start monitor_equipment]
  // [Start call_bakc_dir1]
  // provide the watch callback
  callBackDir1 = (watchEvent: WatchEvent): void => {
    if (watchEvent != undefined) {
      Logger.info('NotifyType: ' + watchEvent.event + ' NotifyFile:' + watchEvent.fileName);
      // [StartExclude call_bakc_dir1]
      this.result = 'Monitoring succeeded'; // update the result state
      // [EndExclude call_bakc_dir1]
    } else {
      Logger.error('watchEvent is undefined');
    }
  }
  // [End call_bakc_dir1]

  // register directory watcher
  registerObserver(): void {
    try {
      // watch the file changes of the sandbox directory and create a demo file to trigger the callback
      let hostContext = this.getUIContext().getHostContext();
      if (!hostContext) {
        return;
      }
      let watchDir: string = hostContext.filesDir;
      this.watcher = fs.createWatcher(watchDir, WATCH_EVENTS, this.callBackDir1);
      this.watcher.start();
      let file: fs.File =
        fs.openSync(watchDir + '/monitor_demo.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.closeSync(file);
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      Logger.error('registerObserver failed, errCode:' + error.code + ', errMessage:' + error.message);
    }
  }

  // unregister directory watcher
  unregisterObserver(): void {
    try {
      if (this.watcher != null) {
        this.watcher.stop(); // stop watching
        this.watcher = null;
      }
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      Logger.error('unregisterObserver failed, errCode:' + error.code + ', errMessage:' + error.message);
    }
  }
  // [End monitor_equipment]
}