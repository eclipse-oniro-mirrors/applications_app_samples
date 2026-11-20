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
// [Start cross_language_index]
import nativeNode from 'libentry.so';
import { NodeController, UIContext, FrameNode, typeNode, BuilderNode, NodeContent } from '@kit.ArkUI';

@Builder
function insideScroll() {
  Column() {
    ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (item: number) => {
      Text(item.toString())
        .width('75%')
        .height(50)
        .backgroundColor(0xFFFFFF)
        .borderRadius(15)
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .margin({ top: 10 })
    }, (item: number) => item.toString())
  }
  .width('100%')
}

class MyNodeController extends NodeController {
  private uiContext: UIContext | null = null;
  private rootNode: FrameNode | null = null;
  public scrollNode: FrameNode | null = null;
  private scroller: Scroller = new Scroller();

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width('80%').height('50%').borderWidth(2).margin(15);
    const scroll = typeNode.createNode(uiContext, 'Scroll');
    scroll.initialize(this.scroller).id('scroll');
    this.scrollNode = scroll;
    this.rootNode.appendChild(this.scrollNode);
    const builderNode = new BuilderNode(uiContext);
    builderNode.build(wrapBuilder(insideScroll));
    this.scrollNode?.appendChild(builderNode.getFrameNode());
    return this.rootNode;
  }
}

@Entry
@Component
struct CrossLanguage {
  private myNodeController: MyNodeController = new MyNodeController();
  @State attributeSetting: boolean = false;
  @State getCrossLanguageOptions: string = '{"attributeSetting": false}';
  private rootSlot = new NodeContent();

  aboutToAppear(): void {
    // 传递NodeContent对象用于Native创建跨语言示例组件的挂载显示。
    nativeNode.createCrossLanguageRoot(this.rootSlot);
  }

  aboutToDisappear(): void {
    // 页面销毁时释放Native侧组件。
    nativeNode.destroyNativeRoot();
  }

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Column() {
          Scroll() {
            Column() {
              NodeContainer(this.myNodeController)
              Button('setCrossLanguageOptions').margin({ bottom: 15})
                .onClick(() => {
                  this.attributeSetting = !this.attributeSetting;
                  this.myNodeController.scrollNode?.setCrossLanguageOptions({
                    attributeSetting: this.attributeSetting
                  });
                  // 若attributeSetting为true，表示scrollNode支持通过非ArkTS语言进行属性设置，否则为不支持
                  this.getCrossLanguageOptions =
                    JSON.stringify(this.myNodeController.scrollNode?.getCrossLanguageOptions());
                })
              Text('CrossLanguageOptions: ' + this.getCrossLanguageOptions)
            }
          }.scrollBarColor(Color.Transparent)
        }
        .width('100%')
        .height(350)
        .backgroundColor(0xeeeeee)
        .id('Part_TS')

        Column() {
          ContentSlot(this.rootSlot)
        }
        .width(500)
        .height(400)
        .id('Part_C')
      }
      .width('100%')
    }.scrollBarColor(Color.Transparent)
  }
}
// [End cross_language_index]
