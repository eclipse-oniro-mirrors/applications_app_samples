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

import { MultiNavigation, MultiNavPathStack, router, SplitPolicy } from '@kit.ArkUI';
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

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('MultiNavigationDemo');
    this.multiStack.pushPathByName(RouteConstants.HOME, 'home', false, SplitPolicy.HOME_PAGE);
    this.updateStack('push home');
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

  private updateStack(action: string): void {
    this.stackText = NavigationUtils.stackSummary(this.multiStack);
    this.action = `${action}, size=${this.multiStack.size()}, mode=${this.mode}`;
    Logger.info(this.action);
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
      .padding(12)

      Row({ space: 6 }) {
        Button('Pop').id('navPop').onClick(() => {
          if (this.multiStack.size() > 1) {
            this.multiStack.pop();
          }
          this.updateStack('pop');
        })
        Button('Move').id('navMove').onClick(() => {
          const index = this.multiStack.moveToTop(RouteConstants.DETAIL);
          this.action = `moveToTop index=${index}, stack=${NavigationUtils.stackSummary(this.multiStack)}`;
          Logger.info(this.action);
        })
        Button('Remove').id('navRemove').onClick(() => {
          const count = this.multiStack.removeByName(RouteConstants.DETAIL);
          this.action = `remove detail count=${count}, stack=${NavigationUtils.stackSummary(this.multiStack)}`;
          Logger.info(this.action);
        })
        Button('Placeholder').id('navPlaceholder').onClick(() => {
          this.multiStack.setPlaceholderPage(new NavPathInfo(RouteConstants.PLACEHOLDER, 'placeholder'));
          this.action = 'placeholder set';
          Logger.info(this.action);
        })
        Button('Home').id('navHome').onClick(() => {
          this.multiStack.popToIndex(0);
          this.updateStack('popToIndex 0');
        })
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Text(`${this.action} | stack=${this.stackText}`)
        .id('multiActionText')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12, bottom: 6 })

      Column() {
        MultiNavigation({
          multiStack: this.multiStack,
          navDestination: this.PageMap,
          onNavigationModeChange: (mode: NavigationMode) => {
            this.mode = mode.toString();
            Logger.info(`MultiNavigation mode changed: ${this.mode}`);
          },
          onHomeShowOnTop: (name: string) => {
            this.updateStack(`home on top ${name}`);
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
