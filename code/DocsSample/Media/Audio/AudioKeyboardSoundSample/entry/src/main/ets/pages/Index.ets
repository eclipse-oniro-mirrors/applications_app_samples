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
import { DefaultKeyboardController, SolutionKeyboardController } from
  '../common/controllers/KeyboardSoundController';

@Entry
@Component
struct Index {
  private defaultController: DefaultKeyboardController = new DefaultKeyboardController();
  private solutionController: SolutionKeyboardController = new SolutionKeyboardController();
  @State isReady: boolean = false;
  @State defaultClickCount: number = 0;
  @State solutionClickCount: number = 0;

  async aboutToAppear() {
    await this.defaultController.init();
    await this.solutionController.init();
    this.isReady = true;
  }

  aboutToDisappear() {
    this.defaultController.release();
    this.solutionController.release();
  }

  build() {
    Column({ space: 25 }) {
      Text($r('app.string.title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50 })

      Text($r('app.string.description'))
        .fontSize(13)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin({ left: 20, right: 20 })

      Button($r('app.string.default_button'))
        .width('80%')
        .height(100)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#FF6B6B')
        .fontColor('#FFFFFF')
        .enabled(this.isReady)
        .onClick(async () => {
          this.defaultClickCount++;
          this.solutionController.resetStrategy();
          await this.defaultController.play();
        })

      Text(getContext(this).resourceManager.getStringSync(
        $r('app.string.default_count').id, this.defaultClickCount))
        .fontSize(14)
        .fontColor('#FF6B6B')

      Button($r('app.string.solution_button'))
        .width('80%')
        .height(100)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#4CAF50')
        .fontColor('#FFFFFF')
        .enabled(this.isReady)
        .onClick(async () => {
          this.solutionClickCount++;
          await this.solutionController.play();
        })

      Text(getContext(this).resourceManager.getStringSync(
        $r('app.string.solution_count').id, this.solutionClickCount))
        .fontSize(14)
        .fontColor('#4CAF50')

      Text($r('app.string.explanation'))
        .fontSize(12)
        .fontColor('#999999')
        .margin({ left: 20, right: 20, top: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
