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

// [Start textImage_attribute]
import {
  $r,
  Button,
  Builder,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  DecorationStyle,
  Entry,
  FontWeight,
  ImageAttachment,
  ImageFit,
  ImageSpanAlignment,
  LengthMetrics,
  LineHeightStyle,
  MutableStyledString,
  NavDestination,
  ParagraphStyle,
  Resource,
  Row,
  StyledStringKey,
  Text,
  TextController,
  TextDecorationStyle,
  TextDecorationType,
  TextOverflow,
  TextStyle,
  TextVerticalAlign,
  ImageAttachmentInterface,
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import resourceManager from '@ohos.resourceManager';
import { image } from '@kit.ImageKit';
import hilog from '@ohos.hilog';
import resourceToStringManager from '../../common/resource';

const TAG = '[Sample_Textcomponent]';
const DOMAIN = 0xF811;
const BUNDLE = 'Textcomponent_';

@Entry
@Component
export struct styled_string_demo {
  @State message: string = 'Hello World';
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State imagePixelMap3: image.PixelMap | undefined = undefined;
  mutableStr: MutableStyledString = new MutableStyledString('123');
  controller: TextController = new TextController();
  mutableStr2: MutableStyledString = new MutableStyledString('This is set decoration line style to the mutableStr2', [{
    start: 0,
    length: 15,
    styledKey: StyledStringKey.DECORATION,
    styledValue: new DecorationStyle({
      type: TextDecorationType.Overline,
      color: Color.Orange,
      style: TextDecorationStyle.DOUBLE
    })
  }]);
  // [StartExclude textImage_attribute]

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, BUNDLE + 'aboutToAppear initial imagePixelMap');
    this.getPixmapFromMedia($r('app.media.sky'));
  }

  private async getPixmapFromMedia(resource: Resource): Promise<void> {
    if (!resource) {
      return;
    }
    let context: UIContext = this.getUIContext();
    if (!context) {
      return;
    }
    let manager: resourceManager.ResourceManager | undefined = context.getHostContext()?.resourceManager;
    if (!manager) {
      return;
    }
    try {
      let unit8Array = await manager.getMediaContent(resource.id);
      if (!unit8Array) {
        return;
      }
      let imageSource = image.createImageSource(unit8Array?.buffer?.slice(0, unit8Array?.buffer?.byteLength));
      if (!imageSource) {
        return;
      }
      let createPixelMap: image.PixelMap | undefined = await imageSource.createPixelMap({
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      });
      await imageSource.release();
      if (!createPixelMap) {
        return;
      }
      this.imagePixelMap = createPixelMap as image.PixelMap;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `Get pixmap failed. error code: ${error.code}, error message: ${error.message}`);
    }
  }
  // [EndExclude textImage_attribute]

  leadingMarginValue: ParagraphStyle = new ParagraphStyle({
    leadingMargin: LengthMetrics.vp(5),
    maxLines: 2,
    overflow: TextOverflow.Ellipsis,
    textVerticalAlign: TextVerticalAlign.BASELINE
  });
  lineHeightStyle1: LineHeightStyle = new LineHeightStyle(new LengthMetrics(24));
  boldTextStyle: TextStyle = new TextStyle({ fontWeight: FontWeight.Bold });
  paragraphStyledString1: MutableStyledString =
    new MutableStyledString(resourceToStringManager.resourceToString($r('app.string.print_photo')), [
      {
        start: 0,
        length: 28,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.leadingMarginValue
      },
      {
        start: 11,
        length: 4,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: this.lineHeightStyle1
      }
    ]);
  paragraphStyledString2: MutableStyledString =
    new MutableStyledString(resourceToStringManager.resourceToString($r('app.string.limited_time_discount')), [
      {
        start: 0,
        length: 5,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.leadingMarginValue
      },
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: new LineHeightStyle(new LengthMetrics(40))
      },
      {
        start: 0,
        length: 9,
        styledKey: StyledStringKey.FONT,
        styledValue: this.boldTextStyle
      },
      {
        start: 1,
        length: 9,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(20), fontColor: Color.Red })
      },
      {
        start: 11,
        length: 4,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Grey, fontSize: LengthMetrics.vp(14) })
      }
    ]);
  paragraphStyledString3: MutableStyledString =
    new MutableStyledString(resourceToStringManager.resourceToString($r('app.string.sales_volume')), [
      {
        start: 0,
        length: 15,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.leadingMarginValue
      },
      {
        start: 0,
        length: 7,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: new LineHeightStyle(new LengthMetrics(40))
      },
      {
        start: 0,
        length: 7,
        styledKey: StyledStringKey.FONT,
        styledValue: this.boldTextStyle
      },
      {
        start: 1,
        length: 1,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(18), fontColor: Color.Red })
      },
      {
        start: 2,
        length: 2,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(36), fontColor: Color.Red })
      },
      {
        start: 4,
        length: 3,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(20), fontColor: Color.Red })
      },
      {
        start: 7,
        length: 9,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Grey, fontSize: LengthMetrics.vp(14) })
      }
    ]);

  build(): void {
    Row() {
      Column({ space: 10 } as ColumnOptions) {
        Text(undefined, { controller: this.controller })
          .copyOption(CopyOptions.InApp)
          .draggable(true)
          .backgroundColor('#FFFFFF')
          .borderRadius(5)
          .width(210)
        Button($r('app.string.textImageMixedLayout_content'))
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap as image.PixelMap,
                size: { width: 210, height: 190 },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Fill,
                layoutStyle: {
                  borderRadius: LengthMetrics.vp(5)
                }
              } as ImageAttachmentInterface));
              this.paragraphStyledString1.appendStyledString(this.paragraphStyledString2);
              this.paragraphStyledString1.appendStyledString(this.paragraphStyledString3);
              this.mutableStr.appendStyledString(this.paragraphStyledString1);
              this.controller.setStyledString(this.mutableStr);
            }
          })
      }
      .width('100%')
    }
    .height
    (
      '100%'
    )
    .backgroundColor
    (
      '#F8F8FF'
    )
  }
}
// [End textImage_attribute]
@Builder
export function TextImageAttribute(): void {
  NavDestination() {
    styled_string_demo()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.TextImage_MixedLayout_Text_2'))
}