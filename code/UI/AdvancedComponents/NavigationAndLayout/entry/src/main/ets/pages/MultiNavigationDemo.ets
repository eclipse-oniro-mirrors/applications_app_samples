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

import { MultiNavigation, MultiNavPathStack, promptAction, router, SplitPolicy } from '@kit.ArkUI';
import { DetailParam } from '../models/DemoModels';
import { RouteConstants } from '../utils/Constants';
import { NavigationUtils } from '../utils/NavigationUtils';
import Logger from '../util/Logger';

@Component
struct HomePage {
  @Consume('multiStack') stack: MultiNavPathStack;
  private items: DetailParam[] = [
    new DetailParam(1, 'Alpha item', 'First item opened with SplitPolicy.DETAIL_PAGE'),
    new DetailParam(2, 'Beta item', 'Second item opened with SplitPolicy.DETAIL_PAGE'),
    new DetailParam(3, 'Gamma item', 'Third item opened with SplitPolicy.DETAIL_PAGE')
  ];

  // Compose the page layout and responsive controls.
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        ForEach(this.items, (item: DetailParam) => {
          Button(item.title)
            .id(`homeItem_${item.id}`)
            .width('100%')
            .onClick(() => {
              this.stack.pushPathByName(RouteConstants.DETAIL, item, true, SplitPolicy.DETAIL_PAGE);
              Logger.info(`push detail ${item.title}, stack=${NavigationUtils.stackSummary(this.stack)}`);
            })
        }, (item: DetailParam) => item.id.toString())

        Button($r('app.string.open_full'))
          .id('homeOpenFull')
          .width('100%')
          .onClick(() => {
            this.stack.pushPathByName(RouteConstants.FULL, 'full-page', true, SplitPolicy.FULL_PAGE);
            Logger.info(`push full page, stack=${NavigationUtils.stackSummary(this.stack)}`);
          })

        Button('PushPath with NavPathInfo')
          .id('homePushPath')
          .width('100%')
          .onClick(() => {
            const param = new DetailParam(9, 'PushPath item', 'Pushed by pushPath(NavPathInfo)');
            this.stack.pushPath(new NavPathInfo(RouteConstants.DETAIL, param), true, SplitPolicy.DETAIL_PAGE);
            Logger.info(`pushPath detail, stack=${NavigationUtils.stackSummary(this.stack)}`);
          })
      }
      .padding(16)
      .width('100%')
    }
    .title('Home')
  }
}

@Component
struct DetailPage {
  @Consume('multiStack') stack: MultiNavPathStack;
  param: DetailParam = new DetailParam(0, '', '');

  // Compose the page layout and responsive controls.
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        Text(this.param.title)
          .id('detailTitle')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text(this.param.description)
          .id('detailDescription')
          .fontSize(14)
        Button($r('app.string.back'))
          .id('detailBack')
          .onClick(() => {
            this.stack.pop();
            Logger.info(`pop detail, stack=${NavigationUtils.stackSummary(this.stack)}`);
          })
        Button('Push next detail')
          .id('detailPushNext')
          .onClick(() => {
            const next = new DetailParam(this.param.id + 1, `Detail ${this.param.id + 1}`,
              'Pushed from detail page');
            this.stack.pushPathByName(RouteConstants.DETAIL, next, true, SplitPolicy.DETAIL_PAGE);
            Logger.info(`push next detail, stack=${NavigationUtils.stackSummary(this.stack)}`);
          })
      }
      .padding(16)
      .width('100%')
    }
    .title(this.param.title)
  }
}

@Component
struct FullPage {
  @Consume('multiStack') stack: MultiNavPathStack;

  // Compose the page layout and responsive controls.
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        Text('Full page')
          .id('fullPageTitle')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Button($r('app.string.back'))
          .id('fullBack')
          .onClick(() => {
            this.stack.pop();
            Logger.info(`pop full page, stack=${NavigationUtils.stackSummary(this.stack)}`);
          })
      }
      .padding(16)
      .width('100%')
    }
    .title('Full page')
  }
}

@Component
struct PlaceholderPage {
  // Compose the page layout and responsive controls.
  build() {
    NavDestination() {
      Text('Placeholder page')
        .id('placeholderTitle')
        .fontSize(20)
    }
    .title('Placeholder')
  }
}

/** MultiNavigation sample page. */
@Entry
@Component
struct MultiNavigationDemo {
  @Provide('multiStack') multiStack: MultiNavPathStack = new MultiNavPathStack();
  @State mode: string = 'unknown';
  @State stackText: string = '(empty)';
  @State action: string = 'idle';
  @State operationCount: number = 0;
  @State activeAction: string = 'idle';
  @State history: string[] = [];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('MultiNavigationDemo');
    this.multiStack.pushPathByName(RouteConstants.HOME, 'home', false, SplitPolicy.HOME_PAGE);
    this.record('push home', 'home');
    Logger.event('MultiNavigationDemo', 'initialized', `stack=${this.stackText}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('MultiNavigationDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('MultiNavigationDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('MultiNavigationDemo');
  }

  private record(action: string, active: string): void {
    this.stackText = NavigationUtils.stackSummary(this.multiStack);
    this.action = `${action}, size=${this.multiStack.size()}, mode=${this.mode}`;
    this.activeAction = active;
    this.operationCount++;
    this.history = [`#${this.operationCount} ${action}`, ...this.history].slice(0, 3);
    Logger.info(this.action);
  }

  private pathItems(): string[] {
    return this.stackText === '(empty)' ? [] : this.stackText.split(' > ');
  }

  @Builder
  pathChips() {
    Row({ space: 6 }) {
      Text('Path')
        .fontSize(11)
        .fontColor('#666666')
      Scroll() {
        Row({ space: 4 }) {
          ForEach(this.pathItems(), (item: string, index: number) => {
            Row({ space: 4 }) {
              if (index > 0) {
                Text('>')
                  .fontSize(10)
                  .fontColor('#999999')
              }
              Text(item)
                .fontSize(11)
                .fontColor(index === this.pathItems().length - 1 ? '#FFFFFF' : '#0A59F7')
                .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                .backgroundColor(index === this.pathItems().length - 1 ? '#0A59F7' : '#E8F1FF')
                .borderRadius(9)
            }
          }, (item: string, index: number) => `${index}-${item}`)
        }
      }
      .layoutWeight(1)
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
    }
    .id('multiPath')
    .width('100%')
    .height(32)
    .padding({ left: 12, right: 12, bottom: 4 })
  }

  @Builder
  statCard(label: string, value: string, id: string) {
    Column({ space: 2 }) {
      Text(label)
        .fontSize(11)
        .fontColor('#666666')
      Text(value)
        .id(id)
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
    }
    .layoutWeight(1)
    .height(56)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
    .borderRadius(10)
  }

  @Builder
  PageMap(name: string, param?: object) {
    if (name === RouteConstants.HOME) {
      HomePage();
    } else if (name === RouteConstants.DETAIL) {
      DetailPage({ param: param as DetailParam });
    } else if (name === RouteConstants.FULL) {
      FullPage();
    } else if (name === RouteConstants.PLACEHOLDER) {
      PlaceholderPage();
    }
  }

  // Compose the page layout and responsive controls.
  build() {
    Column() {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('multiBack')
          .onClick(() => {
            Logger.info('back to index from MultiNavigationDemo');
            router.back();
          })
        Text($r('app.string.multi_title'))
          .id('multiTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 12, bottom: 6 })

      Row({ space: 8 }) {
        this.statCard('Depth', `${this.multiStack.size()}`, 'multiDepth')
        this.statCard('Mode', this.mode, 'multiMode')
        this.statCard('Actions', `${this.operationCount}`, 'multiOperations')
      }
      .width('100%')
      .padding({ left: 12, right: 12, bottom: 8 })

      this.pathChips()

      Scroll() {
        Row({ space: 6 }) {
        Button('Pop').id('navPop')
          .fontSize(13)
          .height(32)
          .fontColor(this.activeAction === 'pop' ? '#FFFFFF' : '#0A59F7')
          .backgroundColor(this.activeAction === 'pop' ? '#0A59F7' : '#E8F1FF')
          .padding({ left: 12, right: 12 })
          .onClick(() => {
          if (this.multiStack.size() > 1) {
            this.multiStack.pop();
          }
          this.record('pop', 'pop');
          promptAction.showToast({ message: this.action, duration: 1500 });
        })
        Button('Move').id('navMove')
          .fontSize(13)
          .height(32)
          .fontColor(this.activeAction === 'move' ? '#FFFFFF' : '#0A59F7')
          .backgroundColor(this.activeAction === 'move' ? '#0A59F7' : '#E8F1FF')
          .padding({ left: 12, right: 12 })
          .onClick(() => {
          const index = this.multiStack.moveToTop(RouteConstants.DETAIL);
          this.record(`moveToTop index=${index}`, 'move');
          promptAction.showToast({ message: this.action, duration: 1500 });
        })
        Button('Remove').id('navRemove')
          .fontSize(13)
          .height(32)
          .fontColor(this.activeAction === 'remove' ? '#FFFFFF' : '#0A59F7')
          .backgroundColor(this.activeAction === 'remove' ? '#0A59F7' : '#E8F1FF')
          .padding({ left: 12, right: 12 })
          .onClick(() => {
          const count = this.multiStack.removeByName(RouteConstants.DETAIL);
          this.record(`remove detail count=${count}`, 'remove');
          promptAction.showToast({ message: this.action, duration: 1500 });
        })
        Button('Placeholder').id('navPlaceholder')
          .fontSize(13)
          .height(32)
          .fontColor(this.activeAction === 'placeholder' ? '#FFFFFF' : '#0A59F7')
          .backgroundColor(this.activeAction === 'placeholder' ? '#0A59F7' : '#E8F1FF')
          .padding({ left: 12, right: 12 })
          .onClick(() => {
          this.multiStack.setPlaceholderPage(new NavPathInfo(RouteConstants.PLACEHOLDER, 'placeholder'));
          this.record('placeholder set', 'placeholder');
          promptAction.showToast({ message: this.action, duration: 1500 });
        })
        Button('Home').id('navHome')
          .fontSize(13)
          .height(32)
          .fontColor(this.activeAction === 'home' ? '#FFFFFF' : '#0A59F7')
          .backgroundColor(this.activeAction === 'home' ? '#0A59F7' : '#E8F1FF')
          .padding({ left: 12, right: 12 })
          .onClick(() => {
          this.multiStack.popToIndex(0);
          this.record('popToIndex 0', 'home');
          promptAction.showToast({ message: this.action, duration: 1500 });
        })
        }
        .padding({ left: 12, right: 12 })
      }
      .width('100%')
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)

      Text(`${this.action} | stack=${this.stackText}`)
        .id('multiActionText')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .height(34)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .padding({ left: 12, right: 12, bottom: 6 })

      Column({ space: 2 }) {
        Row() {
          Text('Recent actions')
            .fontSize(11)
            .fontColor('#666666')
          Blank()
          Button('Clear')
            .id('multiClearHistory')
            .fontSize(10)
            .height(22)
            .onClick(() => {
              this.history = [];
              this.operationCount = 0;
              promptAction.showToast({ message: 'Action history cleared', duration: 1200 });
            })
          Text(`#${this.operationCount}`)
            .id('multiOperationCount')
            .fontSize(11)
            .fontColor('#999999')
        }
        .width('100%')
        if (this.history.length === 0) {
          Text('No actions yet')
            .fontSize(11)
            .fontColor('#999999')
            .width('100%')
        } else {
          ForEach(this.history, (item: string) => {
            Text(item)
              .fontSize(11)
              .fontColor('#666666')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .width('100%')
          }, (item: string) => item)
        }
      }
      .id('multiHistory')
      .width('100%')
      .height(96)
      .padding(8)
      .backgroundColor('#F7F8FA')
      .borderRadius(10)
      .margin({ left: 12, right: 12, bottom: 8 })

      Column() {
        MultiNavigation({
          multiStack: this.multiStack,
          navDestination: this.PageMap,
          onNavigationModeChange: (mode: NavigationMode) => {
            this.mode = mode.toString();
            Logger.info(`MultiNavigation mode changed: ${this.mode}`);
          },
          onHomeShowOnTop: (name: string) => {
            this.record(`home on top ${name}`, 'home');
          }
        })
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
