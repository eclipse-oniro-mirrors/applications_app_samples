'use static'
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

// [Start entry3_release_offline_web_page2_static]
// Page2.ets
import {
  Component,
  Row,
  Column,
  Text,
  Button,
  ClickEvent,
  ResourceStr,
  PropRef,
  State,
  NavDestination,
  NavDestinationContext,
  $r,
  NodeContainer,
  NavPathStack,
  Resource,
  Builder
} from '@kit.ArkUI';
import { getFreeWebNode, MyNodeController } from './Common'

@Builder
export function Page2Builder(): void {
  Page2();
}

@Component
struct Page2 {
  @State navPath?: NavPathStack = undefined;
  @PropRef targetUrl: ResourceStr = 'about:blank';
  @State private node?: MyNodeController = getFreeWebNode();
  @State private currentUrl: ResourceStr = this.targetUrl;

  private transUrlToString(url: ResourceStr): string {
    let urlStr: string = "";
    if (url instanceof string) {
      urlStr = url
    } else if (url instanceof Resource) {
      try {
        urlStr = this.getUIContext().getHostContext()?.resourceManager.getStringSync(url.id) as string;
      } catch (error) {
        console.error('getString error, %{public}s', error);
      }
    }
    return urlStr;
  }

  loadUrl(url: ResourceStr): void {
    this.currentUrl = this.transUrlToString(url);
    this.node?.loadUrl(this.currentUrl);
  }

  build() {
    NavDestination() {
      Row() {
        Column() {
          Row() {
            Button($r('app.string.open_new_page')).onClick(() => {
              let params: Record<string, ResourceStr> = { 'targetUrl': this.targetUrl };
              this.navPath?.pushPathByName('Page2', params);
            })
              .margin('5')
              .width('30%')
              .id('open_new_page')

            Button($r('app.string.back')).onClick(() => {
              this.navPath?.pop()
            })
              .margin('5')
              .width('30%')
              .id('back')

            Button($r('app.string.back_home')).onClick(() => {
              this.navPath?.clear();
              this.navPath?.pushPathByName('Home', null);
            })
              .margin('5')
              .width('30%')
              .id('back_home')
          }

          Row() {
            Button($r('app.string.load_test_url1')).onClick(() => {
              this.loadUrl($r('app.string.test_url1'));
            })
              .margin('5')
              .width('40%')

            Button($r('app.string.load_test_url2')).onClick(() => {
              this.loadUrl($r('app.string.test_url2'));
            })
              .margin('5')
              .width('40%')
          }

          Row() {
            Text('navPath size:' + this.navPath?.size() + ', currentUrl: ' + this.currentUrl)
          }

          // NodeContainer用于与NodeController节点绑定，rebuild会触发makeNode
          // Page页通过NodeContainer接口绑定NodeController，实现动态组件页面显示
          if (this.node) {
            NodeContainer(this.node as MyNodeController)
              .height('80%')
              .width('100%')
          } else {
            Text('webNode NodeContainer')
              .height('80%')
              .width('100%')
          }
        }
        .width('100%')
        .height('100%')
      }
      .height('100%')
    }
    // 加载空页面，并结束离线Web组件与页面的绑定
    .onWillHide(() => {
      this.node?.loadUrl('about:blank');
      console.info("testTag onWillHide load about:blank");
      setTimeout(() => {
        this.node = undefined;
      }, 100)
    })
    // 显示前，开始加载网页
    .onWillShow(() => {
      if (!this.node) {
        this.node = getFreeWebNode();
      }
      this.node?.loadUrl(this.currentUrl);
      console.info("onWillHide load " + this.currentUrl);
    })
    .onReady((ctx: NavDestinationContext) => {
      this.navPath = ctx.pathStack;
    })
  }
}

// [End entry3_release_offline_web_page2_static]
