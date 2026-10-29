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

import { promptAction, router } from '@kit.ArkUI';
import { MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';
import { DetailParam } from '../models/DemoModels';
import { RouteConstants } from '../utils/Constants';
import Logger from '../util/Logger';

/** MultiNavigationStack sample page. */
@Entry
@Component
struct MultiNavigationStackDemo {
  private stack: MultiNavPathStack = new MultiNavPathStack();
  @State log: string = 'idle';
  @State operationCount: number = 0;
  @State lastAction: string = 'idle';

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('MultiNavigationStackDemo');
    this.prepare();
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('MultiNavigationStackDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('MultiNavigationStackDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('MultiNavigationStackDemo');
  }

  private append(token: string): void {
    this.log = `${token}\n${this.log}`;
    this.log = this.log.split('\n').slice(0, 5).join('\n');
    this.operationCount++;
    this.lastAction = token;
    promptAction.showToast({ message: token, duration: 1500 });
    Logger.info('stack api updated');
  }

  @Builder
  statCard(label: string, value: string, id: string) {
    Column({ space: 2 }) {
      Text(label)
        .fontSize(11)
        .fontColor('#666666')
      Text(value)
        .id(id)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .layoutWeight(1)
    .height(54)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
    .borderRadius(10)
    .padding({ left: 6, right: 6 })
  }

  private prepare(): void {
    this.stack.clear(false);
    this.stack.pushPathByName(RouteConstants.HOME, 'home', false, SplitPolicy.HOME_PAGE);
    this.stack.pushPathByName(RouteConstants.DETAIL, new DetailParam(1, 'Stack A', 'stack demo'),
      false, SplitPolicy.DETAIL_PAGE);
    this.stack.pushPathByName(RouteConstants.DETAIL, new DetailParam(2, 'Stack B', 'stack demo'),
      false, SplitPolicy.DETAIL_PAGE);
  }

  private detailParam(): DetailParam {
    return new DetailParam(11, 'API detail', 'method coverage');
  }

  // Compose the page layout and responsive controls.
  build() {
    Column() {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('stackBack')
          .onClick(() => {
            router.back();
          })
        Text('MultiNavPathStack APIs')
          .id('stackTitle')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 12, bottom: 6 })

      Row({ space: 8 }) {
        this.statCard('Depth', `${this.stack.size()}`, 'stackDepth')
        this.statCard('Actions', `${this.operationCount}`, 'stackOperations')
        this.statCard('Last API', this.lastAction, 'stackLastAction')
      }
      .width('100%')
      .padding({ left: 12, right: 12, bottom: 8 })

      Row({ space: 8 }) {
        Button('Clear log')
          .id('stackClearLog')
          .fontSize(12)
          .height(30)
          .onClick(() => {
            this.log = 'idle';
            this.lastAction = 'idle';
            this.operationCount = 0;
            promptAction.showToast({ message: 'Stack log cleared', duration: 1200 });
          })
        Button('Reset stack')
          .id('stackReset')
          .fontSize(12)
          .height(30)
          .onClick(() => {
            this.prepare();
            this.append('reset stack');
          })
      }
      .width('100%')
      .padding({ left: 12, right: 12, bottom: 8 })

      Text(this.log)
        .id('stackLog')
        .fontSize(11)
        .fontColor('#666666')
        .width('100%')
        .height(76)
        .maxLines(4)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .padding(8)
        .backgroundColor('#F7F8FA')
        .borderRadius(8)
        .margin({ left: 12, right: 12, bottom: 8 })

      Scroll() {
        Column({ space: 8 }) {
          Button('pushPath(NavPathInfo, options)').id('stackPushOptions').onClick(() => {
            this.stack.pushPath(new NavPathInfo(RouteConstants.DETAIL, this.detailParam()),
              { launchMode: 0, animated: true }, SplitPolicy.DETAIL_PAGE);
            this.append(`pushPathOptions size=${this.stack.size()}`);
          })
          Button('pushPathByName(onPop)').id('stackPushOnPop').onClick(() => {
            this.stack.pushPathByName(RouteConstants.DETAIL, this.detailParam(),
              (popInfo: PopInfo) => {
                this.append(`onPop name=${popInfo.info.name}`);
              }, true, SplitPolicy.DETAIL_PAGE);
            this.append('pushPathByNameOnPop');
          })
          Button('replacePath').id('stackReplace').onClick(() => {
            this.prepare();
            this.stack.replacePath(new NavPathInfo(RouteConstants.FULL, 'full'), true);
            this.append(`replacePath size=${this.stack.size()}`);
          })
          Button('replacePath(options)').id('stackReplaceOptions').onClick(() => {
            this.prepare();
            this.stack.replacePath(new NavPathInfo(RouteConstants.FULL, 'full'),
              { launchMode: 0, animated: true });
            this.append(`replacePathOptions size=${this.stack.size()}`);
          })
          Button('replacePathByName').id('stackReplaceByName').onClick(() => {
            this.prepare();
            this.stack.replacePathByName(RouteConstants.FULL, 'full', true);
            this.append(`replacePathByName size=${this.stack.size()}`);
          })
          Button('removeByIndexes([1])').id('stackRemoveIndexes').onClick(() => {
            this.prepare();
            const count = this.stack.removeByIndexes([1]);
            this.append(`removeByIndexes=${count}`);
          })
          Button('pop(result)').id('stackPopResult').onClick(() => {
            this.prepare();
            this.stack.pop('pop-result', true);
            this.append(`popResult size=${this.stack.size()}`);
          })
          Button('popToName').id('stackPopToName').onClick(() => {
            this.prepare();
            const count = this.stack.popToName(RouteConstants.DETAIL, true);
            this.append(`popToName=${count}`);
          })
          Button('popToName(result)').id('stackPopToNameResult').onClick(() => {
            this.prepare();
            const count = this.stack.popToName(RouteConstants.DETAIL, 'name-result', true);
            this.append(`popToNameResult=${count}`);
          })
          Button('popToIndex(result)').id('stackPopToIndexResult').onClick(() => {
            this.prepare();
            this.stack.popToIndex(1, 'index-result', true);
            this.append(`popToIndexResult size=${this.stack.size()}`);
          })
          Button('moveIndexToTop').id('stackMoveIndexToTop').onClick(() => {
            this.prepare();
            this.stack.moveIndexToTop(1, true);
            this.append(`moveIndexToTop size=${this.stack.size()}`);
          })
          Button('clear').id('stackClear').onClick(() => {
            this.prepare();
            this.stack.clear(false);
            this.append(`clear size=${this.stack.size()}`);
          })
          Button('getParams/indices').id('stackQuery').onClick(() => {
            this.prepare();
            const names = this.stack.getAllPathName();
            const paramByIndex = this.stack.getParamByIndex(1);
            const paramByName = this.stack.getParamByName(RouteConstants.DETAIL);
            const indices = this.stack.getIndexByName(RouteConstants.DETAIL);
            this.append(`query size=${this.stack.size()}, names=${names.length}, params=${paramByName.length}, indices=${indices.length}, param=${paramByIndex !== undefined}`);
          })
          Button('disableAnimation').id('stackDisableAnimation').onClick(() => {
            this.stack.disableAnimation(true);
            this.stack.disableAnimation(false);
            this.append('disableAnimation true/false');
          })
          Button('switchFullScreenState').id('stackFullScreen').onClick(() => {
            const full = this.stack.switchFullScreenState();
            this.append(`switchFullScreenState=${full}`);
          })
          Button('setHomeWidthRange').id('stackHomeWidth').onClick(() => {
            this.stack.setHomeWidthRange(0.3, 0.5);
            this.append('setHomeWidthRange 0.3-0.5');
          })
          Button('keepBottomPage').id('stackKeepBottom').onClick(() => {
            this.stack.keepBottomPage(true);
            this.append('keepBottomPage true');
          })
          Button('setPlaceholderPage').id('stackPlaceholder').onClick(() => {
            this.stack.setPlaceholderPage(new NavPathInfo(RouteConstants.PLACEHOLDER, 'placeholder'));
            this.append('setPlaceholderPage');
          })

        }
        .padding({ left: 12, right: 12, bottom: 16 })
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
