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

import { NavPushPathHelper, router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { DetailParam } from '../models/DemoModels';
import { RouteConstants } from '../utils/Constants';
import { NavigationUtils } from '../utils/NavigationUtils';
import Logger from '../util/Logger';

@Component
struct LocalFallbackPage {
  stack: NavPathStack = new NavPathStack();

  // Compose the page layout and responsive controls.
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        Text('Local fallback page')
          .id('localFallbackTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('HSP page is not available on this build, fallback navigation is used.')
          .fontSize(14)
        Button($r('app.string.back'))
          .id('localFallbackBack')
          .onClick(() => {
            this.stack.pop();
            Logger.info('pop local fallback page');
          })
      }
      .padding(16)
      .width('100%')
    }
    .title('Local fallback')
  }
}

/** Hsp sample page. */
@Entry
@Component
struct HspDemo {
  pageInfo: NavPathStack = new NavPathStack();
  helper: NavPushPathHelper = new NavPushPathHelper(this.pageInfo);
  @State message: string = 'Ready';
  @State stackText: string = '(empty)';

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('HspDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('HspDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('HspDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('HspDemo');
  }

  private updateStack(label: string): void {
    this.stackText = NavigationUtils.pathSummary(this.pageInfo.getAllPathName());
    Logger.event('HspDemo', label, `stack=${this.stackText}`);
  }

  private safeHsp(label: string, action: () => Promise<void>): void {
    try {
      let timer: number = -1;
      const timeout = new Promise<void>((resolve, reject) => {
        timer = setTimeout(() => {
          reject(new Error('HSP load timeout'));
        }, 5000);
      });
      Promise.race([action(), timeout]).then(() => {
        clearTimeout(timer);
        this.message = `${label} success`;
        this.updateStack(label);
      }).catch((error: BusinessError) => {
        clearTimeout(timer);
        this.message = `${label} failed, fallback`;
        Logger.error(`${label} failed: ${JSON.stringify(error)}`);
        this.pushLocalPage();
      });
    } catch (error) {
      const err = error as BusinessError;
      this.message = `${label} failed (sync), fallback`;
      Logger.error(`${label} sync failed: ${JSON.stringify(err)}`);
      this.pushLocalPage();
    }
  }

  private pushLocalPage(): void {
    this.pageInfo.pushPathByName(RouteConstants.LOCAL_FALLBACK, 'local', false);
    this.updateStack('local fallback');
  }

  @Builder
  PageMap(name: string, param?: object) {
    if (name === RouteConstants.LOCAL_FALLBACK) {
      LocalFallbackPage({ stack: this.pageInfo });
    }
  }

  // Compose the page layout and responsive controls.
  build() {
    Column() {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('hspBack')
          .onClick(() => {
            Logger.event('HspDemo', 'back to index');
            router.back();
          })
        Text($r('app.string.hsp_title'))
          .id('hspTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Text(this.message)
        .id('hspMessage')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12, bottom: 6 })

      Text(`stack=${this.stackText}`)
        .id('hspStackText')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12, bottom: 6 })

      Column() {
        Navigation(this.pageInfo) {
          Scroll() {
            Column({ space: 8 }) {
              Button($r('app.string.push_hsp')).id('pushHspButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushPath',
                  () => this.helper.pushPath(RouteConstants.HSP_MODULE,
                    { name: RouteConstants.HSP_DETAIL, param: new DetailParam(101, 'HSP detail', 'pushPath') }, true));
              })
              Button($r('app.string.push_local')).id('pushLocalButton').width('100%').onClick(() => {
                Logger.event('HspDemo', 'push local fallback');
                this.pushLocalPage();
              })
              Button('Push HSP page by name').id('pushHspByNameButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushPathByName',
                  () => this.helper.pushPathByName(RouteConstants.HSP_MODULE, RouteConstants.HSP_DETAIL,
                    new DetailParam(102, 'HSP by name', 'pushPathByName'), true));
              })
              Button('Replace with HSP page').id('replaceHspButton').width('100%').onClick(() => {
                this.safeHsp('HSP replacePath',
                  () => this.helper.replacePath(RouteConstants.HSP_MODULE,
                    { name: RouteConstants.HSP_DETAIL, param: new DetailParam(103, 'HSP replace', 'replacePath') }, true));
              })
              Button('Push HSP destination').id('pushHspDestinationButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushDestination',
                  () => this.helper.pushDestination(RouteConstants.HSP_MODULE,
                    { name: RouteConstants.HSP_DETAIL, param: new DetailParam(104, 'HSP destination', 'pushDestination') },
                    false));
              })
              Button('Push HSP destination by name').id('pushHspDestinationByNameButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushDestinationByName',
                  () => this.helper.pushDestinationByName(RouteConstants.HSP_MODULE, RouteConstants.HSP_DETAIL,
                    new DetailParam(105, 'HSP destination by name', 'pushDestinationByName'), true));
              })
              Button('Replace HSP by name').id('replaceHspByNameButton').width('100%').onClick(() => {
                this.safeHsp('HSP replacePathByName',
                  () => this.helper.replacePathByName(RouteConstants.HSP_MODULE, RouteConstants.HSP_DETAIL,
                    new DetailParam(106, 'HSP replace by name', 'replacePathByName'), true));
              })
              Button('Push HSP with NavigationOptions').id('pushHspOptionsButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushPath options',
                  () => this.helper.pushPath(RouteConstants.HSP_MODULE,
                    { name: RouteConstants.HSP_DETAIL, param: new DetailParam(107, 'HSP options', 'pushPath options') },
                    { launchMode: 0, animated: true }));
              })
              Button('Replace HSP with NavigationOptions').id('replaceHspOptionsButton').width('100%').onClick(() => {
                this.safeHsp('HSP replacePath options',
                  () => this.helper.replacePath(RouteConstants.HSP_MODULE,
                    { name: RouteConstants.HSP_DETAIL, param: new DetailParam(108, 'HSP replace options', 'replacePath options') },
                    { launchMode: 0, animated: true }));
              })
              Button('Push HSP by name (onPop)').id('pushHspByNameOnPopButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushPathByName onPop',
                  () => this.helper.pushPathByName(RouteConstants.HSP_MODULE, RouteConstants.HSP_DETAIL,
                    new DetailParam(109, 'HSP onPop', 'pushPathByName onPop'),
                    (popInfo: PopInfo) => {
                      this.message = `onPop last=${popInfo.info.name}`;
                      Logger.event('HspDemo', 'onPop', this.message);
                    }, true));
              })
              Button('Push HSP dest by name (onPop)').id('pushHspDestByNameOnPopButton').width('100%').onClick(() => {
                this.safeHsp('HSP pushDestinationByName onPop',
                  () => this.helper.pushDestinationByName(RouteConstants.HSP_MODULE, RouteConstants.HSP_DETAIL,
                    new DetailParam(110, 'HSP dest onPop', 'pushDestinationByName onPop'),
                    (popInfo: PopInfo) => {
                      this.message = `onPop last=${popInfo.info.name}`;
                      Logger.event('HspDemo', 'onPop', this.message);
                    }, true));
              })
            }
            .padding(16)
            .width('100%')
          }
          .layoutWeight(1)
          .width('100%')
        }
        .navDestination(this.PageMap)
        .title('HSP navigation')
        .layoutWeight(1)
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
