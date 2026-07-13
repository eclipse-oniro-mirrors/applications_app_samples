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

// [Start nested_scrolling2]
import {
  $rawfile,
  Column,
  Component,
  Entry,
  ForEach,
  List,
  ListItem,
  Scroll,
  Scroller,
  Text,
  Web,
  BaseGestureEvent,
  GestureRecognizer,
  GestureJudgeResult,
  ScrollState,
  WebBypassVsyncCondition,
  State,
  GestureControl,
  TextAlign,
  OnScrollFrameBeginHandlerResult
} from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller();
  listScroller: Scroller = new Scroller();
  webController: webview.WebviewController = new webview.WebviewController(undefined);
  isWebAtEnd: boolean = false;
  webHeight: number;
  @State arr: Array<int> = new Array<int>();

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i)
    }
  }

  getWebHeight() {
    try {
      this.webController.runJavaScriptExt('window.innerHeight',
        (error, result) => {
          if (error || !result) {
            return;
          }
          if (result.getType() === webview.JsMessageType.NUMBER) {
            this.webHeight = result.getNumber() as Double;
          }
        })
    } catch (error) {
    }
  }

  checkScrollBottom() {
    this.isWebAtEnd = false;
    try {
      if (this.webController.getPageOffset().y + this.webHeight >= this.webController.getPageHeight()) {
        this.isWebAtEnd = true;
      }
    } catch (err) {
      console.error(`checkScrollBottom failed with error: ${err.code}, ${err.message}`);
    }
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        Web({
          src: $rawfile('scroll.html'),
          controller: this.webController,
        }).height('100%')
          .bypassVsyncCondition(WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET)
          .onPageEnd(() => {
            this.webController.setScrollable(false, webview.ScrollType.EVENT);
            this.getWebHeight();
          })
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
            others: Array<GestureRecognizer>) => {
            if (current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
              return GestureJudgeResult.REJECT;
            }
            return GestureJudgeResult.CONTINUE;
          })
        List({ scroller: this.listScroller }) {
          ForEach(this.arr, (item: int) => {
            ListItem() {
              Text('Scroll Area')
                .width('100%')
                .height('40%')
                .backgroundColor(0x330000FF)
                .fontSize(16)
                .textAlign(TextAlign.Center)
            }
          }, (item: int) => item.toString())
        }
        .height('100%')
        .maintainVisibleContentPosition(true)
        .enableScrollInteraction(false)
      }
    }
    .onScrollFrameBegin((offset: double, state: ScrollState) => {
      this.checkScrollBottom();
      if (offset > 0) {
        if (!this.isWebAtEnd) {
          this.webController.scrollBy(0, offset)
          return { offsetRemain: 0 } as OnScrollFrameBeginHandlerResult
        } else if (this.scroller.isAtEnd()) {
          this.listScroller.scrollBy(0, offset)
          return { offsetRemain: 0 } as OnScrollFrameBeginHandlerResult
        }
      } else if (offset < 0) {
        if (this.listScroller.currentOffset()!.yOffset > 0) {
          this.listScroller.scrollBy(0, offset)
          return { offsetRemain: 0 } as OnScrollFrameBeginHandlerResult
        } else if (this.scroller.currentOffset()!.yOffset <= 0) {
          this.webController.scrollBy(0, offset)
          return { offsetRemain: 0 } as OnScrollFrameBeginHandlerResult
        }
      }
      return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult
    })
  }
}

// [End nested_scrolling2]