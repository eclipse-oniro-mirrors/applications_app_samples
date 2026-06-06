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

// [Start styledStringHtml_start]
import {
  $r,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  ImageAttachment,
  LengthMetrics,
  MutableStyledString,
  NavDestination,
  Resource,
  Row,
  StyledString,
  StyledStringKey,
  Text,
  TextController,
  TextStyle,
  ImageAttachmentInterface,
  PixelMap
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { image } from '@kit.ImageKit';
import hilog from '@ohos.hilog';
import { ComponentCard } from '../../common/Card';
import resourceToStringManager from '../../common/resource';

@Entry
@Component
export struct StyledStringHtml {
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State html: string | undefined = undefined;
  @State styledString: StyledString | undefined = undefined;
  controller1: TextController = new TextController;
  controller2: TextController = new TextController;

  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', 'aboutToAppear initial imagePixelMap');
    this.imagePixelMap = this.getPixmapFromMedia($r('app.media.startIcon'));
  }

  private getPixmapFromMedia(resource: Resource): image.PixelMap | undefined {
    try {
      let unit8Array = this.getUIContext().getHostContext()?.resourceManager?.getMediaContentSync(resource.id);
      if (!unit8Array) {
        return undefined;
      }
      let imageSource =
        image.createImageSource(unit8Array?.buffer.slice(0, unit8Array?.buffer?.byteLength ?? 0) as ArrayBuffer);
      if (!imageSource) {
        return undefined;
      }
      let createPixelMap = imageSource.createPixelMapSync({
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      });
      imageSource.release();
      return createPixelMap;
    } catch (error) {
      hilog.error(0x0000, 'testTag', `Get Pixmap failed. error code: ${error.code}, error message: ${error.message}`);
    }
    return undefined;
  }

  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        // [StartExclude styledStringHtml_start]
        // 请将$r('app.string.StyledStringHtml_title')替换为实际资源文件，在本示例中该资源文件的value值为"格式转换"
        ComponentCard({ title: $r('app.string.StyledStringHtml_title') }) {
          // [EndExclude styledStringHtml_start]
          Column() {
            Text(undefined, { controller: this.controller1 }).height(100)
            Row() {
              // 请将$r('app.string.StyledStringHtml_Button_1')替换为实际资源文件，在本示例中该资源文件的value值为"添加属性字符串"
              Button($r('app.string.StyledStringHtml_Button_1')).onClick(() => {
                // 请将$r('app.string.StyledStringHtml_Text_1')替换为实际资源文件，在本示例中该资源文件的value值为"属性字符串"
                let mutableStyledString1: MutableStyledString =
                  new MutableStyledString(this.getUIContext()
                    .getHostContext()!.resourceManager.getStringSync($r('app.string.StyledStringHtml_Text_1').id), [{
                    start: 0,
                    length: 6,
                    styledKey: StyledStringKey.FONT,
                    styledValue: new TextStyle({ fontColor: Color.Green, fontSize: LengthMetrics.px(50) })
                  }]);
                if (this.imagePixelMap !== undefined) {
                  let mutableStyledString2 = new MutableStyledString(new ImageAttachment({
                    value: this.imagePixelMap as PixelMap,
                    size: { width: 50, height: 50 },
                  } as ImageAttachmentInterface));
                  mutableStyledString1.appendStyledString(mutableStyledString2);
                }
                this.styledString = mutableStyledString1;
                this.controller1.setStyledString(mutableStyledString1);
              }).margin(5)
              // 请将$r('app.string.StyledStringHtml_Button_2')替换为实际资源文件，在本示例中该资源文件的value值为"toHtml"
              Button($r('app.string.StyledStringHtml_Button_2')).onClick(() => {
                if (this.styledString) {
                  this.html = StyledString.toHtml(this.styledString as StyledString);
                }
              }).margin(5)
              // 请将$r('app.string.StyledStringHtml_Button_3')替换为实际资源文件，在本示例中该资源文件的value值为"fromHtml"
              Button($r('app.string.StyledStringHtml_Button_3')).onClick(() => {
                if (!this.html) {
                  return;
                }
                StyledString.fromHtml(this.html as string).then((styledString: StyledString | undefined) => {
                  if (styledString) {
                    this.controller2.setStyledString(styledString);
                  }
                });
              }).margin(5)
            }

            Text(undefined, { controller: this.controller2 }).height(100)
            Text(this.html)
          }.width('100%')
        }

        // [StartExclude styledStringHtml_start]
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })

      // [EndExclude styledStringHtml_start]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.StyledStringHtml_title')替换为实际资源文件，在本示例中该资源文件的value值为"格式转换"
    .title($r('app.string.StyledStringHtml_title'))
  }
}

// [End styledStringHtml_start]
